class ActivitiesController < ApplicationController

    # GET to /activities
    def index 
        render json: Activity.all
    end 

    # DELETE to /activities/:id
    def destroy
        activity = Activity.find_by(id:params[:id])
        if activity
            activity.signups.destroy_all
            activity.destroy
        else
            render json: {"error": "Activity not found"}, status: :not_found 
        end        
    end 
end
 