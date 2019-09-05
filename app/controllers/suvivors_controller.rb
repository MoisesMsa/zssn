class SuvivorsController < ApplicationController
  def show
    suvirvor = suvivor.find(:params[id])
    render json: {status: "ok", message: "success", data: suvirvor}, status: :ok
  end

  def index
    suvirvors = Suvivor.all
    render json: {status: "ok", message: "success", data: suvirvors}
  end

  def destroy
    suvirvor = Suvivor.find(:params[id])
    suvivor.destroy
    render json: {status: "ok", message: "success", data: suvirvor}, status: :ok
  end

  def update
    suvirvor = Suvivor.find(:params[id])
    if suvivor.update(params)
        render json: {status: "ok", message: "success", data: suvirvor}, status: :ok
    else
        render json: {status: "error", message: "success", data: suvirvor}, status: :error
    end
  end

  def create
    suvirvor = Suvivor.new(params);
    if suvivor.save
        render json: {status: "ok", message: "success", data: suvirvor}, status: :ok
    else
        render json: {status: "error", message: "success", data: suvirvor}, status: :error
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
end
