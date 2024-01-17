class GridsController < ApplicationController
  # before_action :authenticate_user

  def index
    @grids = Grid.all
    render :index
  end

  def create
    @grid = Grid.create(
      user_id: current_user.id,
      code: params["code"],
    )
    render :show
  end

  def show
    @grid = Grid.find_by(id: params[:id])
    render :show
  end

  def update
    @grid = Grid.find_by(id: params[:id])
    @grid.update(
      user_id: params[:user_id] || @grid.user_id,
      code: params[:code] || @grid.code,
    )
    #happy path
    if @grid.valid?
      render :show
      #sad path
    else
      render json: { errors: @grid.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @grid = Grid.find_by(id: params[:id])
    @grid.destroy
    render json: { message: "Grid has been deleted 😈" }
  end
end
