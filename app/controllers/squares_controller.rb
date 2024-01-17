class SquaresController < ApplicationController
  # before_action :authenticate_user

  def index
    @squares = Square.all
    render :index
  end

  def create
    @square = Square.create(
      user_id: current_user.id,
      grid_id: params["grid_id"],
      x_location: params["x_location"],
      y_location: params["y_location"],
    )
    render :show
  end

  def show
    @square = Square.find_by(id: params[:id])
    render :show
  end

  def update
    @square = Square.find_by(id: params[:id])
    @square.update(
      user_id: params[:user_id] || @square.user_id,
      grid_id: params[:grid_id] || @square.grid_id,
      x_location: params[:x_location] || @square.x_location,
      y_location: params[:y_location] || @square.y_location,
    )
    #happy path
    if @square.valid?
      render :show
      #sad path
    else
      render json: { errors: @square.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @square = Square.find_by(id: params[:id])
    @square.destroy
    render json: { message: "Square has been deleted 😈" }
  end
end
