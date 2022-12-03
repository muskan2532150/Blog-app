class Comment < ApplicationRecord
  after_save :update_comments_count
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  validates :text, length: {maxmium:250}, presence:true

  def update_comments_count
    post.increment!(:comments_counter)
  end
end
