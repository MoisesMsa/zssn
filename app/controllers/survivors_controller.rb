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

     #preciso dessas rotas especificas? ja tem o update?
     def location

         lat = params[:latitude].to_f
         long = params[:longitude].to_f

         if(lat >= 0 && lat <= 0 && long >=0 && long >= 180)
             update
         else
              render json: {status: "error", message: "failed", data: "invalid values"}, status: :error
         end
     end

    #relacionar com o inventario
    def trade
        survivor_1 = Inventory.find(:user_id1);
        survivor_2 = Inventory.find(:user_id2);

        if(!(survivor_1.infected || survivor_2.infected))
        #check if suvivir has the itens
        #calc the total valuations in the trade itens
        points1 = calc_points(params(:items1))
        points2 = calc_points(params(:items2))
        #update and record the new values
        if points1 == points2
        Inventory.update
        end
        render json: {message:"success", data: trade}, status: :ok
        else
        render json: {status: "error", message:"failed", data: trade.erros}, status: :ok
        end
    end

    def calc_points(items)
        total = 0
        items.each do |i|
            total += Items.select(points).find(i)
        end
    end

    private
        def survivors_params
            params.permit(:name, :age, :gender, :latitude, :longitude)
        end
end
