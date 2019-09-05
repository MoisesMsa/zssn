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
end
