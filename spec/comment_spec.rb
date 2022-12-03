require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.new(name: 'Muskan', posts_counter: 1)
    @post = Post.new(author: @user, title: 'Sakshi', comment_counter: 1, likes_counter: 1)
  end

  it 'is valid without a title' do
    comment = Comment.new(text: 'test', author_id: @user.id, post_id: @post.id)
    expect(comment).to_not be_valid
  end

  it 'is not valid if without author id' do
    comment = Comment.new(author_id: nil)
    expect(comment).to_not be_valid
  end
end
