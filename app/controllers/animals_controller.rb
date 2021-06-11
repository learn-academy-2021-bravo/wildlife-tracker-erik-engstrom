class AnimalsController < ApplicationController

  def index 
    animals = Animal.all
    render json: animals
  end

  def update 
    animals = Animal.all(params[:id])
    render json: animals
    if animals.update
      render json: animals
    else 
      render json: animals.errors
    end
  end

  def show 
    animal = Animal.find(params[:id])
    render json: animal, include: :sightings
  end

  def destroy
    animals = Animal.find(params[:id])
    if animals.destroy
      render json: animals
    else
      render json: animals.errors
    end
  end

  # private
  # def guitar_params
  #   params.require(:guitar).permit(:strings, :manufacturer, :model, :color)
  # end
end
