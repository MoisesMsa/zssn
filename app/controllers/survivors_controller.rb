class SurvivorsController < ApplicationController
  def show
    survivors = Survivor.find(:params[id])
    render json: {status: "ok", message: "success", data: survivors}, status: :ok
  end

  def index
    survivorss = Survivor.all
    render json: {status: "ok", message: "success", data: survivorss}
  end

  def destroy
    survivors = Survivor.find(params[:id])
    survivors.destroy
    render json: {status: "ok", message: "success", data: survivors}, status: :ok
  end

  def update
    survivors = Survivor.find(survivors_params)
    if survivor.update(params)
        render json: {status: "ok", message: "success", data: survivors}, status: :ok
    else
        render json: {status: "error", message: "success", data: survivors}, status: :error
    end
  end

  def create
    survivors = Survivor.new(survivors_params);
    if survivors.save
        render json: {status: "ok", message: "success", data: survivors}, status: :ok
    else
        render json: {status: "error", message: "success", data: survivors.erros}, status: :error
    end
  end

  #preciso dessas rotas especificas? ja tem o update?
  def location
  end

  #relacionar com o inventario
  def trade
    survivor_1 = Inventory.find(:user_id1);
    survivor_2 = Inventory.find(:user_id2);

    #check if suvivir has the itens
    #calc the total valuations in the trade itens
    points1 = calc_points(params(:items1))
    points2 = calc_points(params(:items2))
    #update and record the new values
    if points1 == points2
      Inventory.update
    end
  end


  def calc_points(items)
    total = 0
    item.each do |i|
      total += Items.select(points).find(i)
    end
  end

  private
    def survivors_params
      params.permit(:name, :age, :gender, :latitude, :longitude)
    end
end
