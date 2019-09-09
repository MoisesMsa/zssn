class InventoriesController < ApplicationController

	def trade
		suvivor = Survivor.select('items.name', 'inventories.total').joins(:item).all

		render json:{data: suvivor}
		# s1 = Survivor.find(params[:id1])
		# s2 = Survivor.find(params[:id2])

		# if(params[:id1].nil? || params[:id2].nil? || params[:items1].nil? || params[:items2].nil?)
		# 	render json: {error: "empty values"}, status: :error
		# elsif(s1.infected || s2.infected) 
		# 	render json: {error: "infected"}, status: :error
		# else
		# 	if check_points([params[:id1], params[:id2]],[params[:items1], params[:items2]])
		# 		swap_itens()	    
		# 	    render json: {data: "a"}
		# 	end
		# end
	end

		def check_points(survivor_id, items)

			points = [0, 0]
			equal = false
			#check if the survivor has the items to trade
			for i in 0..1
				items[i].each do |item|
					item_id = get_item_id(item[:name])
					if get_total_item(survivor_id[i], item_id) > 0
						points[i] += get_item_points(item_id)*item[:total].to_i
					end
				end
			end

			if points[0] == points[1]
				equal = true
			end

		    equal
		end

		def get_item_points(item_id)
			item = Item.find(item_id)
			item.points
		end

		def get_item_id(item_name)
			item = Item.find_by(name: item_name)
			item.id
		end

		def get_total_item(user_id, item_id)
			Inventory.where(survivor_id:  user_id, item_id: item_id).sum(:total)
		end

	private    

		def update(user_id, items_remove, items_add, remove = false)
			# if Inventory.where(survivor_id: user_id).exists?(item_id: item_id)
			# 	inventory = Inventory.where(survivor_id: user_id, item_id: items[:item_id])
			# 	if remove
			# 		total = inventory.total - total
			# 	else
			# 		total = items[:total]
			# 	end
			# 	inventory.update(total: total)
			# else
			# 	Inventory.create(survivor_id: user_id, item_id: items[:item_id], total)
			# end
		end

		def swap_itens(user_ids, items_survirvors)
			update(user_id[0], items[0], items[1],true)
			update(user_id[1], items[1], items[0], false)
		end

end
