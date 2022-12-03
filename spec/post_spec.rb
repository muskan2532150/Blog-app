require 'rails_helper'

describe Post, User do
  before do
    @user = User.new(name: 'Muskan', posts_counter: 1)
  end

  it 'is not valid without a title' do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid if comments counter is not interger' do
    post = Post.new(comment_counter: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid if likes counter is not interger' do
    post = Post.new(likes_counter: nil)
    expect(post).to_not be_valid
  end
  
  it 'is not valid with a title longer than 250 characters' do
    post = Post.new(title: 'ddd')
    post.title = 'ddd' * 251
    expect(post).to_not be_valid
  end

  it 'is not valid with a comments_counter being less than 0' do
    post = Post.new(comment_counter: 0)
    post.comment_counter = -1
    expect(post).to_not be_valid
  end
  
  it 'is valid if title is string and comments counter & likes counter is integer' do
    post = Post.new(author: @user, title: 'Sakshi', comment_counter: 1, likes_counter: 1)
    expect(post).to be_valid
  end
end
