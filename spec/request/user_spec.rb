require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = User.create(name: 'User1', email: 'user1@example.com', password: '123456')
    sign_in @user
  end

  after do
    @user.destroy
    User.destroy_all
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get users_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create(name: 'User2', email: 'user2@example.com', password: '123456')
      get user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      user = User.create(name: 'User3', email: 'user3@example.com', password: '123456')
      get edit_user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'redirects to the created user' do
        post users_url, params: { user: { name: 'User4', email: 'user4@example.com', password: '123456' } }
        expect(response).to redirect_to('/')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      user = User.create(name: 'User8', email: 'user8@example.com', password: '123456')
      expect do
        delete user_url(user)
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      user = User.create(name: 'User9', email: 'user9@example.com', password: '123456')
      delete user_url(user)
      expect(response).to redirect_to(users_url)
    end
  end
end
