class ItemsController < ApplicationController
    def index
        item = Item.all
        render json: {status: "ok", message:"success", data: item}, status: :ok
    end

    def update
        
        item = Item.find(params[:id])
        
        if item.update(items_params)
            render json: {status: "ok", message: "success", data: item}, status: :ok
        else
            render json: {status: "error", message: "success", data: item.erros}, status: :error
        end
    end

    def create
        item = Item.new(items_params)

        if item.save
            render json: {status: "ok", message: "success", data: item}, status: :ok
        else
            render json:{status: "error", message: "error", data: item.erros}, status: :ok
        end
    end
  
    def show
        item = Item.find(params[:id])
        render json:{status: "success", message: "success", data: item}, status: :ok
    end
  
    private 
        def items_params
            params.permit(:name, :points)
        end
end
