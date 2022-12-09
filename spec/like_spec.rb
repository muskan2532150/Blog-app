require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.create(name: 'Muskan', posts_counter: 1)
    @post = Post.create(author: @user, title: 'Sakshi', comment_counter: 1, likes_counter: 1)
  end

  it 'is valid without a title' do
    like = Like.create(author_id: @user, post_id: @post)
    expect(like).to_not be_valid
  end

  it 'is not valid if without author id' do
    post = Like.create(author_id: nil)
    expect(post).to_not be_valid
  end
end
