class RecipesController < ApplicationController
  before_action :set_rec, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @rec = Recipe.new
    require_logged_in
  end

  def create
    binding.pry
    params[:recipe][:ingredient_name]
    @rec = Recipe.new

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
    params.require(:recipe).permit(:name, :user_id, :time, :description, :rating)
  end
end
