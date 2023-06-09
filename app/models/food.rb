class Food < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true

  validates :measuring_unit, presence: true
  validates :price, numericality: { is_decimal: true }
  validates :quantity, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }
end
