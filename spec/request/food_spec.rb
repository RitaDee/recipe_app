RSpec.describe FoodsController, type: :request do
  describe 'GET /foods' do
    it 'renders the index template' do
      sign_in User.create(email: 'test@example.com', password: 'password')
      get foods_path
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /foods/new' do
    it 'renders the new template' do
      sign_in User.create(email: 'test@example.com', password: 'password')
      get new_food_path
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end
end
