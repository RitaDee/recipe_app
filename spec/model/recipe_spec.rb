require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create(name: 'Rita', email: 'rita@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @recipe = Recipe.create(name: 'Coconut rice', preparation_time: 10.2, cooking_time: 20.3,
                            description: 'Boil Water first and chill', public: true, user_id: @user.id)
  end
  it 'is valid with valid attributes' do
    expect(@recipe).to be_valid
  end
  it 'is not valid without a name' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end
  it 'is not valid without a preparation time' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid
  end
  it 'is not valid without a cooking time' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid
  end
  it 'is not valid without a description' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end
  it 'is not valid with a preparation time enters as string' do
    @recipe.preparation_time = 'two'
    expect(@recipe).to_not be_valid
  end
  it 'is not valid with a cooking time enters as string' do
    @recipe.cooking_time = 'four'
    expect(@recipe).to_not be_valid
  end
  it 'it is not valid without a user' do
    @recipe.user_id = nil
    expect(@recipe).to_not be_valid
  end
end
