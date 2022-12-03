class Post < ApplicationRecord
  after_save :update_posts_count
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  validates :title, length: {minimum:2},presence:true
  validates_numericality_of :comment_counter, :only_integer, presence:true
  validates_numericality_of :likes_counter, :only_integer, presence:true

  def update_posts_count
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    Comment.where(post_id: id).last(5)
  end
end
