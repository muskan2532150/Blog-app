class Post < ApplicationRecord
    after_save :update_posts_count
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    has_many :comments, foreign_key: 'post_id'
    has_many :likes, foreign_key: 'post_id'

    def update_posts_count
        author.increment!(:posts_counter)
      end
    
      def five_recent_comments
        Comment.where(post_id: id).last(5)
      end
end
