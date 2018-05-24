class RecipesController < ApplicationController
  before_action :set_rec, only: [:edit, :update, :destroy]
  @@keywords = []

  def index
  end

  def show
  end

  def new
    require_logged_in
  end

  def create

  end

  def scrape
    recipe = params[:"/recipes/new"]
    if recipe[:ingredient].to_s.empty? && recipe[:name].empty?
      flash.now[:notice] = "Go on, pick something!"
      render :new
      return
    end

    if !recipe[:name].empty?
      @@keywords = []
      @ing = Ingredient.create(name: recipe[:name])
      current_user.ingredients << @ing
      @@keywords << @ing
      if !recipe[:ingredient].to_s.empty?
        picked = recipe[:ingredient]
        picked.reject!(&:empty?)
        picked.each do |i|
          @@keywords << i
        end
      end
      binding.pry
      redirect_to create_path
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
