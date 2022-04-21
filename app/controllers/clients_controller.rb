class ClientsController < ApplicationController

    def show
        client = Client.find_by(id: params[:id])
        if client 
            render json: client, status: :ok 
        else 
            render json: {error: "client not found"}, status: :not_found 
        end 
    end 

end
