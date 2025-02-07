class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @blog, notice: "Comment added successfully."
    else
      redirect_to @blog, alert: "Failed to add comment."
    end
  end

  def destroy
    def destroy
      @comment = Comment.find_by(id: params[:id])
      if @comment
        @comment.destroy
        redirect_to blog_path(@comment.blog), notice: "Comment was successfully deleted."
      else
        redirect_to blogs_path, alert: "Comment not found."
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
