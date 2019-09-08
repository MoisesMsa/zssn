class InventoriesController < ApplicationController

	def trade
	   	s1 = Survivor.find(params[:id1])
	   	s2 = Survivor.find(params[:id2])
	    
	    if(params[:id1].nil? || params[:id2].nil? || params[:items1].nil? || params[:items2].nil?)
	    	render json: {error: "empty values"}, status: :error
	    elsif(s1.infected || s2.infected) 
	    	render json: {error: "infected"}, status: :error
	    else
	    	inventories = survivor_inventory([params[:id1], params[:id2]])

	    	if check_points([params[:id1], params[:id2]],[params[:items1], params[:items2]])
	    		puts "TRUEEEEEEE"
				# swap_itens	    
	   #  		render json: {data: "a"}
	    	end
	    end
	end

	private    

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
        
        return equal
	 end

	  def survivor_inventory(survivor_id)
	  	inventories = Array.new
	  	
	  	for i in 0..1
     		inventory = Inventory.select("items.name, items.points, inventories.total")
        			.where(survivor_id: survivor_id[0])
        			.joins('JOIN items on items.id = inventories.item_id')
        	inventories.push(inventory)
        end

        return inventories
      end 

      def get_item_points(item_id)
      	item = Item.find(item_id)
      	return item.points
      end

      def get_item_id(item_name)
      	item = Item.find_by(name: item_name)
      	return item.id
      end
   
      def get_total_item(user_id, item_id)
	  	Inventory.where(survivor_id:  user_id, item_id: item_id).sum(:total)
	  end
	 
	  def remove_item(survivor_id, item, total)
	  	inventory_item = Inventory.find(survivor_id)
	  	total = inventory.total - total

	  	if(total > 0)
	  		inventory_item.update(item[:id], item[:total])
	  	end
	  end


end
