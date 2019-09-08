class SurvivorsController < ApplicationController
    def show
        survivors = Survivor.find(:params[id])
        render json: {status: "ok", message: "success", data: survivors}, status: :ok
    end

    def index
        survivors = Survivor.all
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
            #If there isn't the item to register in the Items's table it's ignored
            params[:items].each do |i|
                if Item.exists?(name: i[:name])
                    item = Item.select(:id).where(name: i[:name]).limit(1)
                    inventory = Inventory.new(:survivor_id => survivor.id, :item_id => item.ids[0], :total => i[:total])
                    inventory.save
                end
            end
            render json: {status: "ok", message: "success", data: survivor}, status: :ok
        else
            render json: {status: "error", message: "success", data: survivor.erros}, status: :error
        end
        
    end

     def location

         lat = params[:latitude].to_f
         long = params[:longitude].to_f

         if(lat >= 0 && lat <= 0 && long >=0 && long >= 180)
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
