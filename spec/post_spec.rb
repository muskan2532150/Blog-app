require 'rails_helper'

describe Post, User do
  before do
    @user = User.create(name: 'Muskan', posts_counter: 0)
  end

  it 'is not valid without a title' do
    post = Post.create(title: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid if comments counter is not interger' do
    post = Post.create(comment_counter: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid if likes counter is not interger' do
    post = Post.create(likes_counter: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid with a title longer than 250 characters' do
    post = Post.create(title: 'ddd')
    post.title = 'ddd' * 251
    expect(post).to_not be_valid
  end

  it 'is not valid with a comments_counter being less than 0' do
    post = Post.create(comment_counter: 0)
    post.comment_counter = -1
    expect(post).to_not be_valid
  end

  it 'Not returns the most recent posts' do
    post = Post.create(author: @user, title: 'Sakshi', comment_counter: 1, likes_counter: 1)
    comment1 = Comment.create(text: 'test', author_id: @user, post_id: post)
    comment2 = Comment.create(text: 'test', author_id: @user, post_id: post)
    comment3 = Comment.create(text: 'test', author_id: @user, post_id: post)
    comment4 = Comment.create(text: 'test', author_id: @user, post_id: post)
    comment5 = Comment.create(text: 'test', author_id: @user, post_id: post)
    comment6 = Comment.create(text: 'test', author_id: @user, post_id: post)
    expect(post.five_recent_comments).to_not eq([comment1, comment2, comment3, comment4, comment5, comment6])
  end

  it 'Updates the posts counter' do
    Post.create(author: @user, title: 'Sakshi', comment_counter: 1, likes_counter: 1)
    Post.create(author: @user, title: 'Sakshi', comment_counter: 1, likes_counter: 1)
    Post.create(author: @user, title: 'Sakshi', comment_counter: 1, likes_counter: 1)
    Post.create(author: @user, title: 'Sakshi', comment_counter: 1, likes_counter: 1)
    expect(@user.posts_counter).to eq(4)
  end

  it 'is valid if title is string and comments counter & likes counter is integer' do
    post = Post.create(author: @user, title: 'Sakshi', comment_counter: 1, likes_counter: 1)
    expect(post).to be_valid
  end
end
