require 'rails_helper'

describe User do
  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid if posts counter is not interger' do
    user = User.new(name: nil, posts_counter: nil)
    expect(user).to_not be_valid
  end

  it 'is valid if name is string and post counter is integer' do
    user = User.new(name: 'Muskan', posts_counter: 1)
    expect(user).to be_valid
  end
end
