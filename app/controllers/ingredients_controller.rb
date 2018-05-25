class IngredientsController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update]
  before_action :set_ingred, only: [:show]

  def index
    require_logged_in
  end

  def show
    require_logged_in

  end

  def new
    require_logged_in
    @ingred = Ingredient.new
  end

  def create
    @ingred = Ingredient.new(ingred_params)
    if @ingred.save
      @user.ingredients.create!(ingred_params)
      redirect_to user_ingredients_path(@ingred), notice: "Ingredient was added to your pantry!"
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

  def set_ingred
    @ingred = Ingredient.find(params[:id])
  end

  def ingred_params
    params.require(:ingredient).permit(:name, :quantity)
  end
end
