class InventoriesController < ApplicationController

	def trade
		#get all the records in the database where the paramater matchs

		survivor_1 = Survivor.survivor_inventory(params[:id1], params[:items1names])
		survivor_2 = Survivor.survivor_inventory(params[:id2], params[:items2names])
		
		totais_1 = params[:items1totals]
		totais_2 = params[:items2totals]
		
		render json: {survivor_1: survivor_1, survivor_2: survivor_2}

		# if(params[:id1].nil? || params[:id2].nil? || params[:items1].nil? || params[:items2].nil?)
		# 	render json: {error: "empty values"}, status: :error
		if(survivor_1[0][:infected] || survivor_2[0][:infected]) 
			render json: {error: "infected"}, status: :error
		else
			if check_points([survivor_1, survivor_2])
				# update(survivor_1)
			end
		end
	end

	def check_points(items)	
		points = Array.new
		
		items.each do |item|
		  sum = item.sum{|i| i.total*i.points}
		  points.push sum
		end		

		points[0] == points[1] ? true : false
	end

	private    
		def update(items)
			items = find_or_create_by()
			items.update_attributes()
		end
end
