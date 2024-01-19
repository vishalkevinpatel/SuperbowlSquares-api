class GridsController < ApplicationController
  # before_action :authenticate_user

  def index
    @grids = Grid.all
    render :index
  end

  def create
    random_digits = (0..9).to_a.shuffle.join.to_s
    random_digits1 = (0..9).to_a.shuffle.join.to_s
    random_code = SecureRandom.alphanumeric(6)

    @grid = Grid.create(
      user_id: current_user.id,
      code: random_code,
      rows_digit: random_digits,
      columns_digit: random_digits1,
      name: params[:name],
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
