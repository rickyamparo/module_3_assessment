class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    render json: Item.find(params[:id]).destroy
    head :no_content
  end

end
