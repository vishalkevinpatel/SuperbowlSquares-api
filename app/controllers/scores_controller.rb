class ScoresController < ApplicationController
  def index
    @scores = Score.all
    render :index
  end

  def create
    @score = Score.create(
      location: params[:location],
      quarter: params[:quarter],
      points: params[:points],
    )
    render :show
  end

  def update
    @score = Score.find_by(id: params[:id])
    @score.update(
      location: params[:location] || @score.location,
      quarter: params[:quarter] || @score.quarter,
      points: params[:points] || @score.points,
    )
    #happy path
    if @score.valid?
      render :show
      #sad path
    else
      render json: { errors: @score.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
