class User < ApplicationRecord
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  validates :name, presence:true
  validates_numericality_of :posts_counter, :only_integer, presence:true

  def three_recent_posts
    posts.where(author_id: id).last(3)
  end
end
