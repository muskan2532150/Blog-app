class Like < ApplicationRecord
  after_save :update_likes_count
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_likes_count
    post.increment!(:likes_counter)
  end
end
