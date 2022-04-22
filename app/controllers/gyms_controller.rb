class GymsController < ApplicationController

    def index
        gyms = Gym.all 
        render json: gyms, status: :ok 
    end 

    def show
        gym = Gym.find_by(id: params[:id])
        if gym 
            render json: gym, status: :ok
        else
            render json: {error: "gym not found!"}, status: :not_found
        end 
    end 

    def update
        gym = Gym.find_by(id: params[:id])
        if gym
            gym.update(gym_params)
            render json: gym, status: ok
        else
            render json: {error: "gym not found!"}, status: :not_found
        end
    rescue ActiveRecord::RecordInValid => invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def destroy
        gym = Gym.find_by(id: params[:id])
        if gym
            gym.destroy
            render json: {}, status: :ok
        else 
            render json: {"error": "Gym not found"}, status: :not_found
        end 
    end 

    private 

    def gym_params
        params.permit(:name, :address)
    end 

end
