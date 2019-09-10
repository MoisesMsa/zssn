class ReportsController < ApplicationController
  
  def get_total
  	Survivor.count(:id)
  end
 
  def get_infected_total
  	infecteds = Survivor.where(:infected => 1).count(:id)
  	total = (infecteds.to_f/(get_total.to_f))*100
  	render json: {status: "ok", message: "success",total_infecteds: total}, status: :ok
  end

  def get_non_infected_total
  	no_infecteds = Survivor.where(:conditions => "infected != 1").count(:id)
  	total = (no_infecteds.to_f/(get_total.to_f))*100
  	render json: {status: "ok", message: "success",total_survivors: total}, status: :ok
  end

  def avg_items
    items = Item.all
  	avgs = Hash.new
    items.each do |i|
      avg = Item.joins(inventory: [:survivor])
              .select('items.name', 'inventories.item_id', 'inventories.total')
              .where(:name => i.name)
              .average(:total)
      avgs[i.name] = avg
    end

  	render json: {status: "ok", message: "success", item_average: avgs}, status: :ok
  end

  def infected_lost_points
    points = Survivor.joins(:item)
            .select('items.points', 'items.name', 'inventories.item_id', 'inventories.total')
            .where(:infected => 1)
            .sum('items.points')
    render json: {status: "ok", message: "success", lost_points: points}, status: :ok
  end
end
