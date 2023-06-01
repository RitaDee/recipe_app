require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    RecipeFood.new(
      quantity: 3,
      recipe: Recipe.first,
      food: Food.first
    )
  end
  before { subject.save }
  describe 'check recipe_food validity' do
    it 'is valid with valid attributes' do
      expect(subject).to_not be_valid
    end
  end

  describe 'check recipe_food invalidity' do
    it 'is invalid with valid quantity entered as string' do
      subject.quantity = '-3'
      expect(subject).to_not be_valid
    end
  end
end