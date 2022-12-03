class User < ApplicationRecord
    has_many :likes, foreign_key: 'author_id'
    has_many :comments, foreign_key: 'author_id'
    has_many :posts, foreign_key: 'author_id'

    def three_recent_posts
        posts.where(author_id: id).last(3)
      end
end
