class ItemsController < ApplicationController
  def index
  	item = Item.all
  	render json: {status: "ok", message:"succes", data: item}
  end

  def update
  end

  def create
  	item = Item.new(items_params)
  	
  	if item.save
 		render json: {status: "ok", message: "success", data: item}, status: :ok
 	else
 		render json:{status: "error", message: "error", data: item.erros}, status: :ok
  	end
  end

  def destroy
  end

  private 
  	def items_params
  		params.permit(:name, :points)
  	end
end
