class InventoriesController < ApplicationController
  def show
  end

  def index
  end

  def trade
  	 inventory = Inventory.joins('JOIN survivors ON survivors.id = inventories.survivor_id JOIN items ON items.id = inventories.item_id')
        .select('inventories.total, inventories.survivor_id, inventories.id, items.name as item_name, survivors.name as suvivor_name, survivors.infected')
        .where("inventories.survivor_id = #{params[:id1]} OR inventories.survivor_id = #{params[:id2]}")
       
        puts inventory.inspect
        render json: {data: inventory}
        # end
  end

   
   def check_items
        items.each do |i|
          if inventory.exists?(i.name )
          end
        end
    end

    def calc_points(items)
        total = 0
        items.each do |i|
            total += Items.select(points).find(i)
        end
    end

end
