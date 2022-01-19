class SignupsController < ApplicationController
    # POST to /signups
    def create 
        new_signup = Signup.create(new_signup_params)
        if new_signup.valid?
            render json: new_signup.activity, status: :created
        else
            render json: {"errors": new_signup.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private 
    def new_signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

end
