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
  	render json: {status: "ok", message: "success",total_infecteds: total}, status: :o
  end

  def avg_items
  	# Item.joins(:inventory).select('items.name', 'inventories.item_id', 'inventories.total').avg(:total)
  	# render json: {status: "ok", message: "success",total_infecteds: infecteds}, status: :ok
  end

  def infected_lost_points
  end
end
