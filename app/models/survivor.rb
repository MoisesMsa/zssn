class Survivor < ApplicationRecord
	has_many :inventory
	has_many :item, through: :inventory

	scope :survivor_inventory, -> (survivor_id, *items) {Survivor.select('survivors.infected', 
												'items.name', 'items.points','inventories.total')
		          								.joins(:item)
		          								.where('survivors.id' => survivor_id, 'items.name' => items)}
		          								
end
