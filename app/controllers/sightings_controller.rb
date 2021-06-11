class SightingsController < ApplicationController

  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end

  def show 
    sightings = Sighting.find([params[:id]])
    render json: sightings
  end

  def create
    sightings = Sighting.create(sighting_params)
    if sightings.valid?
      render json: sightings
    else
      render json: sightings.errors
    end
  end

  def update 
    sightings = Sighting.all(params[:id])
    render json: sightings
    if sightings.update
      render json: sightings
    else 
      render json: sightings.errors
    end
  end

  def destroy
    sightings = Sighting.find(params[:id])
    if sightings.destroy
      render json: sightings
    else
      render json: sightings.errors
    end
  end

  private
  def sighting_params
    params.require(:sightings).permit(:date, :lattitude, :longitude)
  end

end
