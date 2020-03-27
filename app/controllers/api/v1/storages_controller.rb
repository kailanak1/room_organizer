class Api::V1::StoragesController < ApplicationController
     
    def index
        storages = Storage.all
        render json: storages
    end

    def show
        storage = Storage.find(params[:id])
        render json: storage
    end

    def new
        storage = Storage.new
        render json: storage 
    end

    def create
        storage = Storage.create(storage_params)
        if storage.name 
        render json: storage 
        else 
            render json: {message: "Please provide a name"}
        end 
    end

    def edit
        storage = Storage.find(params[:id])
        render json: storage 
    end

    def update
        storage = Storage.find(params[:id])
        storage.update(storage_params)
        render json: storage
    end

    def destroy
        storage = Storage.find(params[:id])
        storage.destroy
        render json: {message: "Storage successfully deleted"} 
    end

    private

    def storage_params
        params.require(:storage).permit(:size, :photo, :name, :room_id)
    end
    
end
