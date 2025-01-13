class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :categories

  validates :description, presence: true
  validates :name, presence: true, uniqueness: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
