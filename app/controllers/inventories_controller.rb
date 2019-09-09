class InventoriesController < ApplicationController

	def trade

		s1 = Survivor.select(:infected).find(params[:id1])
		s2 = Survivor.select(:infected).find(params[:id2])
		
		if(s1.infected || s2.infected) 
			render json: {error: "infected"}, status: :error
		else
			# if check_points([survivor_1, survivor_2])
				update(params[:id1], params[:items][0], params[:items][1])
				update(params[:id2], params[:items][1], params[:items][0])
			# end
		end
	end

	private 
		def update(survivor_id, items_remove, items_add)
			
			items = Item.select('inventories.survivor_id', 'items.name', 'inventories.total')
			  		.joins(:inventory)
			  		.where('inventories.survivor_id' => survivor_id)
			
			items.each do |item|
				for i in 1..0

					item_name = item.name.downcase
	                total = items_remove[item_name]

	                if (items_remove.key?(item_name)) 
						total = inventory.total - total
					elsif items_add.key?(item_name)
						total = inventory.total + total
	                end

	                total = total <= 0 ? 0 : total
	                
	                inventory.update(:total => total)
				end
            end
		end
end
