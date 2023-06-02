require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'John') }

  it 'is valid with valid attributes' do
    expect(Food.new(name: 'Anything', measuring_unit: 100, price: 200, quantity: 1, user: user)).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(name: nil, measuring_unit: 100, price: 200, quantity: 1, user: user)
    expect(food).to_not be_valid
  end

  it 'is not valid without measuring_unit' do
    food = Food.new(name: 'Anything', measuring_unit: nil, price: 200, quantity: 1, user: user)
    expect(food).to_not be_valid
  end

  it 'is not valid without a price' do
    food = Food.new(name: 'Anything', measuring_unit: 100, price: nil, quantity: 1, user: user)
    expect(food).to_not be_valid
  end
end
