require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Is valid with name, email and body' do
    user = create(:user)

    expect(user).to be_valid
  end

  context 'Validates' do 
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }  
    it { is_expected.to validate_presence_of(:password) }  
  end
end
