class Inventory < ApplicationRecord
  belongs_to :survivor
  has_many :items
end
