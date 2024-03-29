class SurvivorsController < ApplicationController
    def show
        survivors = Survivor.find(params[:id])
        render json: {status: "ok", message: "success", data: survivors}, status: :ok
    end

    def index
        survivors = Survivor.where(:infected => nil).all
        render json: {status: "ok", message: "success", data: survivors}
    end

    def destroy
        survivors = Survivor.find(params[:id])
        puts params
        
        if survivors.destroy
            render json: {status: "ok", message: "success", data: survivors}, status: :ok
        else
           render json: {status: "error", message: "failed", data: survivors.errors}, status: :error
        end
    end

    def update
        survivor = Survivor.find(params[:id])
        
        if survivor.update(survivors_params)
            render json: {status: "ok", message: "success", data: survivor}, status: :ok
        else
            render json: {status: "error", message: "success", data: survivor.erros}, status: :error
        end
    end

    def create

        survivor = Survivor.new(survivors_params);
        if survivor.save
             items = Item.all
             #associates all in items's table to the survivor's inventory
             items.each do |item|
                total = params[:items].key?(item.name.downcase) ? params[:items][item.name.downcase] :  0
                inventory = Inventory.new(survivor_id: survivor.id, item_id: item.id, total: total)
                inventory.save
             end

            render json: {status: "ok", message: "success", data: survivor}, status: :ok
        else
            render json: {status: "error", message: "success", data: survivor.erros}, status: :error
        end
        
    end

     def location

         lat = params[:latitude].to_f
         long = params[:longitude].to_f

         if(lat > -1 && lat < 91 && long > -1 && long < 181)
            update
         else
            render json: {status: "error", message: "failed", data: "invalid values"}, status: :error
         end
     end
   
    private
        def survivors_params
            params.permit(:name, :age, :gender, :latitude, :longitude)
        end
end
