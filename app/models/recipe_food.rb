class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :food, uniqueness: { scope: :recipe }
  validates :quantity, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true }
end
