class InfectedsController < ApplicationController

  def index
    infecteds = Infected.all
    render json:{staus: "ok", message:"success", data: infecteds}
  end

  def create
    survivor_id = params[:survivor_id]

    if(Infected.count(survivor_id) >= 3)
      Survivor.update(survivor_id, :infected => 1)
      render json:{status: "ok", message: "infected"}, status: :ok
    elsif
      infected = Infected.new(infected_params)
      if infected.save
        render json:{status: "ok", message: "success", data: infected}, status: :ok
      end
    else
      render json:{status: "error", message: "failed", data: infected.errors}, status: :error
    end
  end

  def infected_params
    params.permit(:survivor_id)
  end
end
