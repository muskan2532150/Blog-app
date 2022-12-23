require 'rails_helper'

RSpec.describe User, type: :feature do
  subject { User.new(name: 'Apple', posts_counter: 0, photo: 'https://randomuser.me/api/portraits/men/70.jpg', bio: 'Teacher from England.') }
  before { subject.save }
  before(:each) do
    Post.create(author_id: subject.id, title: 'Hello!, one', text: 'This is my first post')
    Post.create(author_id: subject.id, title: 'Hello!!, two', text: 'This is my second post')
    Post.create(author_id: subject.id, title: 'Hello!!!, three', text: 'This is my third post')
    Post.create(author_id: subject.id, title: 'Hello!!!!, four', text: 'This is my fourth post')

    visit(user_path(subject.id))
  end

  it 'Display the name of user in show page' do
    expect(subject.name).to have_content('Apple')
  end

  it 'Display the post count of user in show page' do
    expect(page).to have_content('Number of posts: 4')
  end
  it 'Display the bio of user in show page' do
    expect(subject.bio).to have_content('Teacher from England.')
  end

  it 'Rendering to  all post ' do
    click_link('See All Posts')
    expect(current_path).to eq(user_posts_path(subject.id))
  end

  it 'Display post name' do
    subject.three_recent_posts.each do |p|
      expect(page).to have_content(p.title)
    end
  end
end
