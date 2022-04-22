class ClientsController < ApplicationController

    def index
        clients = Client.all 
        render json: clients, status: :ok 
    end 


    def show
        client = Client.find_by(id: params[:id])
        if client 
            render json: client, status: :ok 
        else 
            render json: {error: "client not found"}, status: :not_found 
        end 
    end 

    def update
        client = Client.find_by(id: params[:id])
        if client 
            client.update(client_params)
            render json: client, status: :ok
        else
            render json: {error: "Client not found"}, status: :not_found
        end 
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end 

private 

    def client_params
        params.permit(:name, :age)
    end 

end
