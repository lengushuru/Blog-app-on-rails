class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(user_id: @comment.author_id, id: @comment.post_id),
                  notice: 'Comment was successfully created.'
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
