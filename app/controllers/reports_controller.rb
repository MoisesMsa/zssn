class ReportsController < ApplicationController
  
  def get_infected_total
  	infecteds = Survivor.count(:conditions => "infected = 1")
  	# total = (infecteds/(get_non_infected_total+infecteds))*100
  	# render json: {status: "ok", message: "success",total_infecteds: total}, status: :ok
  end

  def get_non_infected_total
  	no_infecteds = Survivor.count(:conditions => "infected != 1")
  	total = (no_infecteds/(no_infecteds+get_infected_total))*100
  	render json: {status: "ok", message: "success",total_infecteds: total}, status: :o
  end

  def avg_items
  	Item.joins(:inventory).select('items.name', 'inventories.item_id', 'inventories.total').avg(:total)
  	render json: {status: "ok", message: "success",total_infecteds: infecteds}, status: :ok
  end

  def infected_lost_points
  end
end
