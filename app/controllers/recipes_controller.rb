class RecipesController < ApplicationController
  before_action :set_rec, only: [:edit, :update, :destroy]


  def index
  end

  def show
  end

  def mine
  end

  def new
    require_logged_in
  end

  def create
    chosen_recipe = RecipeScraper.new("https://www.food52.com#{params[:recipe].keys.join}")
    @final_recipe = chosen_recipe.all_info
    @recipe = current_user.recipes.build(@final_recipe)
    if @recipe.save
      render :show
    else
      redirect_to recipes_new_path, notice: "Oops! Let's try that again!"
    end
  end

  def scrape
    recipe = params[:"/recipes/new"]
    if recipe[:ingredient].to_s.empty? && recipe[:name].empty?
      flash.now[:notice] = "Go on, pick something!"
      render :new
      return
    end

    if !recipe[:name].empty?
      @ing = Ingredient.create(name: recipe[:name])
      current_user.ingredients << @ing
      current_user.chosen_ingred = @ing.name
      if !recipe[:ingredient].to_s.empty?
        picked = recipe[:ingredient]
        picked.reject!(&:empty?)
        picked.each do |i|
          current_user.chosen_ingred += " #{i}"
        end
      end
      ingred_array = current_user.chosen_ingred
      rec_scrape = RecipeScraper.new("https://www.food52.com/recipes/search?q=#{ingred_array.gsub(" ", "+")}")
      urls = rec_scrape.recipe_url
      pics = rec_scrape.pic
      titles = rec_scrape.title
      @collection = urls.zip(pics, titles).each {|b| b}
      if @collection.count > 18
        @collection.pop(16)
      elsif @collection.count.between?(15, 18)
        @collection.pop(10)
      elsif @collection.count.between?(7, 15)
        @collection.pop(4)
      else
        @collection
      end
      if urls.count < 5
        flash[:notice] = "Woah! I've never heard of that ingredient..."
        Ingredient.last.destroy
        redirect_to recipes_new_path
      return
      end
    end
  end

  def edit
    require_logged_in
  end

  def update
  end

  def destroy
  end

  private

  def set_rec
    @rec = Recipe.find(params[:id])
  end

  def rec_params
    params.require(:recipe).permit(:name, :user_id, :time, :description, :rating, :ing_attr)
  end
end
