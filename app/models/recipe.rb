class Recipe < ApplicationRecord
  has_many :bookmarks, :categories

  validates :description, presence: true
  validates :name, uniqueness: true
  validates :rating, inclusion: {in:%w(0-10)}
end
