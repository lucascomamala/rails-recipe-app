require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is not valid with a duplicate email' do
      existing_user = create(:user, email: 'test@example.com')
      user.email = 'test@example.com'
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'is not valid with an invalid email format' do
      user.email = 'invalid_email'
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('is invalid')
    end
  end

  describe 'associations' do
    it 'destroys associated foods when user is destroyed' do
      food = create(:food, user: user) # Assuming you have a factory named 'food'
      expect { user.destroy }.to change { Food.count }.by(-1)
    end

    it 'destroys associated recipes when user is destroyed' do
      recipe = create(:recipe, user: user) # Assuming you have a factory named 'recipe'
      expect { user.destroy }.to change { Recipe.count }.by(-1)
    end
  end
end
