require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Is valid with title and body' do
    post = create(:post)

    expect(post).to be_valid
  end

  context 'Validates' do 
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }  
  end
end


