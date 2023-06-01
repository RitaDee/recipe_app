class ShoppingListsController < ApplicationController
  before_action :authenticate_user!
  def index
    params[:recipe_id]
    @user = current_user
    @recipes = Recipe.where(user_id: @user.id)
    @food_items = @recipes.map(&:foods).flatten.uniq
    @general_food_lists = @user.foods
    @shopping_list = @general_food_lists - @food_items
    # recipe_ids = @recipes.pluck(:id)
    # recipe_foods = RecipeFood.where(recipe_id: recipe_ids).group(:food_id).sum(:quantity)
    # @shopping_list = []

    # foods = Food.where(id: recipe_foods.keys)

    # recipe_foods.each do |food_id, quantity|
    #   food = foods.find { |f| f.id == food_id }
    #   needed_food = food.quantity - quantity
    #   next unless needed_food.positive?

    #   name = food.name
    #   needed = needed_food
    #   price = needed * food.price
    #   @shopping_list << { name: name, qty: needed, price: price }
    # end

    @total_items = @shopping_list.count 
    @total_price = @shopping_list.sum { |item| item[:price] }
  end
end
