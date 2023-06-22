class PlantsController < ApplicationController
    wrap_parameters format: []

   # GET /plants
    def index
        plants = Plant.all
        render json: plants
    end

    # GET /plants/:id
    def show
        plants = Plant.find_by(id: params[:id])
        if plants
        render json: plants
        else
        render json: { error: "Plant not found" }, status: :not_found
        end
    end

    def create
        plant = Plant.create(params.permit(:name, :image, :price )) 
        render json: plant, status: :created 
      end
end
