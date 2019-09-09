class InventoriesController < ApplicationController

	def trade

		s1 = Survivor.select(:infected).find(params[:id1])
		s2 = Survivor.select(:infected).find(params[:id2])
		
		if(s1.infected || s2.infected) 
			render json: {error: "infected"}, status: :error
		else
			#inventory in database
			s1_inventory = inventory_items(params[:id1])
			s2_inventory = inventory_items(params[:id2])

			#url items to trade
			items_s1 = params[:items][:survivor1]
			items_s2 = params[:items][:survivor2]

			#validate if the trade values are equals
			if(calc_points(s1_inventory, items_s1) == calc_points(s2_inventory, items_s2))
				update(s1_inventory, items_s1, items_s2)
				update(s2_inventory, items_s2, items_s1)
			end
		end
	end

	private 

		def inventory_items(survivor_id)
			items = Item.select('inventories.survivor_id', 'items.name', 'inventories.total', 'items.points')
			  		.joins(:inventory)
			  		.where('inventories.survivor_id' => survivor_id)
		end

		def update(inventory_items, items_remove, items_add)

			inventory_items.each do |item|
				for i in 1..0

					item_name = item.name.downcase
	                total = items_remove[item_name]

	                if (items_remove.key?(item_name)) 
						total = inventory.total - total
					elsif items_add.key?(item_name)
						total = inventory.total + total
	                end

	                total = (total <= 0) ? 0 : total
	                
	                inventory.update(:total => total)
				end
	        end
		end

		def calc_points(inventory_items, items_totals)
			points = 0
			inventory_items.each do |item|
				name = item.name.downcase
				if items_totals.key?(name)
			  		points += items_totals[name].to_i*item.points
			  	end
			end
		end
end
