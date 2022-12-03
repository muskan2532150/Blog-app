require 'rails_helper'

describe User do
  it 'is not valid without a name' do
    user = User.create(name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid if posts counter is not interger' do
    user = User.create(name: nil, posts_counter: nil)
    expect(user).to_not be_valid
  end

  it 'returns the most recent posts' do
    user = User.create(name: 'Muskan', posts_counter: 1)
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    second_post = Post.create(author: first_user, title: 'Hello!', text: 'This is my first post')
    third_post = Post.create(author: first_user, title: 'Hello!!', text: 'This is my first post')
    fourth_post = Post.create(author: first_user, title: 'Hello!!!', text: 'This is my first post')
    expect(user.three_recent_posts).to_not eq([first_post, second_post, third_post, fourth_post])
  end

  it 'is valid if name is string and post counter is integer' do
    user = User.create(name: 'Muskan', posts_counter: 1)
    expect(user).to be_valid
  end
end
