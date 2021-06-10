class AnimalsController < ApplicationController

  def index 
    animals = Animal.all
    render json: animals
  end

  def update 
    animals = Animal.all
    render json: animals
    if animals.valid?
      render json: animals
    else 
      render json: animals.error
    end
  end

end
