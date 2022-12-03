class Like < ApplicationRecord
  after_save :update_likes_count
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def update_likes_count
    post.increment!(:likes_counter)
  end
end
