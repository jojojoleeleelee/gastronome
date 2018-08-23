class CommentsController < ApplicationController

  def index
    set_recipe
    @comments = @recipe.all_comments
    respond_to do |format|
      format.html { render :index, :layout => false }
      format.json { render json: @comments, :layout => false }
    end

  end
  #
  def create
    set_recipe
    @comment = @recipe.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Successfully posted a comment"
    else
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end
    redirect_to recipe_path(@recipe)
  end

  # def edit
  #   set_recipe
  #   set_comment
  # end
  #
  # def update
  #   set_recipe
  #   set_comment
  #
  #   if @comment.update(comment_params)
  #     flash[:notice] = "Edits made"
  #     redirect_to recipe_path(@recipe)
  #   else
  #     flash[:alert] = @comment.errors.full_messages.to_sentence
  #     redirect_to recipe_comment_path(@recipe, @comment)
  #   end
  # end

  # def destroy
  #   set_recipe
  #   set_comment
  #   @comment.destroy
  #   flash[:notice] = "Comment was deleted"
	# 	redirect_to recipe_path(@recipe)
  # end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
