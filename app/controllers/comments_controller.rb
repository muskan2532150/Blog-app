class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(author_id: current_user.id, post_id: post.id, **comment_params)

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(current_user, @comment)
        else
          redirect_to new_user_post_comment_path(current_user)
        end
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
