class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    post = Post.find(params[:post_id])
    @like = Like.new(author_id: current_user.id, post_id: post.id)

    respond_to do |format|
      format.html do
        if @like.save
          redirect_to user_post_path(current_user, @like)
        else
          redirect_to new_user_post_like_path(current_user)
        end
      end
    end
  end
end
