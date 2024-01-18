class SquaresController < ApplicationController
  # before_action :authenticate_user

  def index
    @squares = Square.where(grid_id: params[:grid_id])
    render :index
  end

  def create
    @square = Square.create(
      user_id: params["user_id"],
      grid_id: params["grid_id"],
      location: params["location"],
    )
    render :show
  end

  def show
    @square = Square.find_by(id: params[:id])
    render :show
  end

  def update
    @square = Square.find_by(id: params[:id])
    if @square.user_id == 1
      @square.update(
        user_id: params[:user_id] || @square.user_id,
        grid_id: params[:grid_id] || @square.grid_id,
        location: params[:location] || @square.location,
      )
    end
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
    if @square.user_id == current_user.id
      @square.update(
        user_id: 1,
      )
      render json: { message: "Square has been deleted 😈" }
    else
      render json: { message: "you cannont delete this square" }
    end
  end
end
