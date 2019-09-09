class Survivor < ApplicationRecord
	has_many :inventory
	has_many :item, through: :inventory
end
