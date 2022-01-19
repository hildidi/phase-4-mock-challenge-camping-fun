class CampersController < ApplicationController

    # GET to /campers
    def index 
        render json: Camper.all
    end

    # GET to /campers/:id
    def show
        camper = Camper.find_by(id:params[:id])
        if camper 
            render json: camper, serializer: CampersShowSerializer
        else 
            render json: {"error": "Camper not found"}, status: :not_found
        end
    end

    # POST to /campers
    def create
        new_camper = Camper.create(new_camper_params)
        if new_camper.valid?
            render json: new_camper, status: :created
        else        
            render json: {"errors": new_camper.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private 
    def new_camper_params
        params.permit(:name, :age) 
    end

end
