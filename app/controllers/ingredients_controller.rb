class IngredientsController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update]
  before_action :set_ingredient, only: [:show]

  def index
    require_logged_in
  end

  def show
    require_logged_in
    set_ingredient
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @ingredient }
    end
  end

  def new
    require_logged_in
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      @user.ingredients.create!(ingredient_params)
      redirect_to user_ingredients_path(@ingredient), notice: "Ingredient was added to your pantry!"
    else
      flash.now[:notice] = "Oopsies, try that again!"
      render :new
    end
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end
end
