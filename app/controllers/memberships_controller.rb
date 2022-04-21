class MembershipsController < ApplicationController
    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created 
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end 


    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end 
end
