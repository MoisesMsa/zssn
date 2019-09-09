class Item < ApplicationRecord
	has_many :inventory
	has_many :survivor, through: :inventory
end
