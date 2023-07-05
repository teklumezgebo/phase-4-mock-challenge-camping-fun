class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_create

    def create
        signup = Signup.create!(signup_params)
        activity = Activity.find(params[:activity_id])
        render json: activity, status: :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def unprocessable_entity_create(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
