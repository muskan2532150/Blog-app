class Comment < ApplicationRecord
  after_save :update_comments_count
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  validates :text, length: { maximum: 250 }, presence: true

  def update_comments_count
    post.increment!(:comment_counter)
  end
end
