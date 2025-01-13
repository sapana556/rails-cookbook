class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates :recipe, uniqueness: { scope: :category }
  validates :comment, length: { maximum: 6 }
end
