class ShoppingListsController < ApplicationController
  before_action :authenticate_user!
  def index
    params[:recipe_id]
    @user = current_user
    @recipes = Recipe.where(user_id: @user.id)
    @food_items = @recipes.map(&:foods).flatten.uniq
    @general_food_lists = @user.foods
    @shopping_list = @general_food_lists - @food_items

    @total_items = @shopping_list.count
    @total_price = @shopping_list.sum { |item| item[:price] }
  end
end
