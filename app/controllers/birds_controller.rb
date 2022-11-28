class BirdsController < ApplicationController

  wrap_parameters format: []
  #disabling the wrap param feature. (Individual controller.)

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  #def create
  #  bird = Bird.create(params.permit(:name, :species))
  #  render json: bird, status: :created
  #end
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end
  
  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private
  #all methods below are private; (for strong param).

  def bird_params
    param.permit(:name, :species)
  end

end
