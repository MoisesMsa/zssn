class InventoriesController < ApplicationController

	def trade
		#get all the records in the database where the paramater matchs

		# survivor_1 = Survivor.survivor_inventory(params[:id1], params[:trade][0][:sur_id])
		# survivor_2 = Survivor.survivor_inventory(params[:id2], params[:trade][1][:sur_id])
		
		data = Inventory.select(:id,'items.name', 'inventories.total')
			  .joins(:item)
			  .group('inventories.survivor_id', 'items.name')

		render json: {survivor_1: data }

		# if(params[:id1].nil? || params[:id2].nil? || params[:items1].nil? || params[:items2].nil?)
		# 	render json: {error: "empty values"}, status: :error
		
		# if(survivor_1[0][:infected] || survivor_2[0][:infected]) 
		# 	render json: {error: "infected"}, status: :error
		# else
		# 	totals
		# 	if check_points([survivor_1, survivor_2])
		# 		# update(survivor_1)
		# 	end
		# end
	end

	def totals
		t = params[:items1]
		t.inject(Hash.new(0)) { |total, e| total[e] += 1; total}
		puts t.inspect
	end

	def check_points(items)	
		points = Array.new
		
		items.each_with_index do |item, index|
		  sum = item.sum{|i| i.total*i.points}
		  points.push sum
		end		

		points[0] == points[1] ? true : false
	end

	private 

		def update(items_names, items_totais)
			for i in 0..items.size
				if Survivor.joins(:item).where('item.name' => items_names[i]).exists?
					items.update_attributes(:total => items_totais[i])
				else	
					items = create()
				end
			end
		end
end
