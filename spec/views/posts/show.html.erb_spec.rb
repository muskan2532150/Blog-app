require 'rails_helper'

RSpec.describe Post, type: :feature do 
    subject { User.new(name: 'Apple',posts_counter: 0, photo: 'https://randomuser.me/api/portraits/men/70.jpg', bio: 'Teacher from England.') }
    before { subject.save }  
    
    before(:each) do
    fourth_post = Post.create(author_id:subject.id, title: 'Hello!!!!, four', text: 'This is my fourth post',comment_counter: 0, likes_counter: 0)

    comment1 = Comment.create(post_id: fourth_post.id, author_id: subject.id,text: 'This is the 1st comment on the last post')
    comment2 = Comment.create(post_id: fourth_post.id, author_id: subject.id,text: 'This is the 2nd comment on the last post')
    comment3 = Comment.create(post_id: fourth_post.id, author_id: subject.id,text: 'This is the 3rd comment on the last post')

    visit(user_post_path(subject.id,fourth_post.id))
  end
  
  it 'Display the text of post for a user' do
    expect(page).to have_content('This is my fourth post')    
  end
  
  it 'Display the like and Add Comment button in post page' do
    expect(page).to have_content('Like') 
    expect(page).to have_content('Add a comment')       
  end

  it 'Display all comments a post for certain user' do
    expect(page).to have_content('This is the 1st comment on the last post')
    expect(page).to have_content('This is the 2nd comment on the last post')
    expect(page).to have_content('This is the 3rd comment on the last post')
  end

  it 'Display comments counter for the posts for a user' do
    expect(page).to have_content('Comments: 3')
  end

  it 'Display  Likes counter for the posts for a user' do
    expect(page).to have_content('Likes: 0')
  end

end
