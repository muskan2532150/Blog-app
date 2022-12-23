require 'rails_helper'

RSpec.describe Post, type: :feature do
  subject { User.new(name: 'Apple', posts_counter: 0, photo: 'https://randomuser.me/api/portraits/men/70.jpg', bio: 'Teacher from England.') }
  before { subject.save }

  before(:each) do
    Post.create(author_id: subject.id, title: 'Hello!, one', text: 'This is my first post',
                comment_counter: 0, likes_counter: 0)
    Post.create(author_id: subject.id, title: 'Hello!!, two', text: 'This is my second post',
                comment_counter: 0, likes_counter: 0)
    Post.create(author_id: subject.id, title: 'Hello!!!, three', text: 'This is my third post',
                comment_counter: 0, likes_counter: 0)
    fourth_post = Post.create(author_id: subject.id, title: 'Hello!!!!, four', text: 'This is my fourth post',
                              comment_counter: 0, likes_counter: 0)

    Comment.create(post_id: fourth_post.id, author_id: subject.id, text: 'This is the 1st comment on the last post')
    Comment.create(post_id: fourth_post.id, author_id: subject.id, text: 'This is the 2nd comment on the last post')
    Comment.create(post_id: fourth_post.id, author_id: subject.id, text: 'This is the 3rd comment on the last post')

    visit(user_posts_path(subject.id))
  end

  it 'Display all posts for a user' do
    expect(page).to have_content('Hello!')
    expect(page).to have_content('Hello!!')
    expect(page).to have_content('Hello!!!')
    expect(page).to have_content('Hello!!!!')
  end

  it 'Display all comments for a user' do
    expect(page).to have_content('This is the 1st comment on the last post')
    expect(page).to have_content('This is the 2nd comment on the last post')
    expect(page).to have_content('This is the 3rd comment on the last post')
  end

  it 'Display the name of user in index page of posts' do
    expect(subject.name).to have_content('Apple')
  end

  it 'Display the post count of user in index page of posts' do
    expect(page).to have_content('Number of posts: 4')
  end

  it 'Display the bio of user in index page of posts' do
    expect(subject.bio).to have_content('Teacher from England.')
  end

  it 'Display all comments counter for all posts for a user' do
    expect(page).to have_content('Comments: 3')
    expect(page).to have_content('Comments: 0')
  end

  it 'Display all Likes counter for all posts for a user' do
    expect(page).to have_content('Likes: 0')
  end

  it 'Renderning to a certain post' do
    click_link('Hello!!!!')
    expect(current_path).to eq(user_post_path(subject.id, 32))
  end
end
