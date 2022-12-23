class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  validates :name, presence: true, allow_blank: false
  validates_numericality_of :posts_counter, only_integer: true, presence: true, greater_than_or_equal_to: 0,
                                            allow_nil: true

  def three_recent_posts
    posts.where(author_id: id).last(3)
  end
end
