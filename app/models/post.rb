class Post < ApplicationRecord
  after_save :update_posts_count
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, length: { maxmium: 250 }, presence: true, allow_blank: false
  validates_numericality_of :comment_counter, only_integer: true, presence: true, greater_than_or_equal_to: 0,
                                              allow_nil: true
  validates_numericality_of :likes_counter, only_integer: true, presence: true, greater_than_or_equal_to: 0,
                                            allow_nil: true

  def update_posts_count
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
