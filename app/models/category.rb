class Category < ApplicationRecord
  has_many :bookmarks, depenedent: :destroy
  has_many :recipes, through: :bookmarks
end
