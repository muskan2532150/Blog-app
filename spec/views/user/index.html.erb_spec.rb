require 'rails_helper'

RSpec.describe User, type: :feature do
    subject { User.new(name: 'Apple', posts_counter: 2, photo: 'https://randomuser.me/api/portraits/men/70.jpg', bio: 'Teacher from England.') }
    before { subject.save }  

    before(:each) do
        visit('/users')
    end

    it 'Display the name of user in home page' do
        expect(subject.name).to have_content('Apple')
    end

    it 'Display the post count of user in home page' do
        expect(subject.posts_counter).to have_content(2)
    end

    it 'Display the image of user in home page' do
         page.has_css?('.img-fluid')
        end

    it 'Redirect to user show page' do
        click_link(subject.name)
        expect(current_path).to eq(user_path(subject.id))
    end
end


