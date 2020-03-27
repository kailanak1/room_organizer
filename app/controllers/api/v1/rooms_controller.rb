class Api::V1::RoomsController < ApplicationController
    
    def index
        rooms = Room.all
        render json: rooms
    end

    def show
        room = Room.find(params[:id])
        render json: room
    end

    def new
        room = Room.new
        render json: room 
    end

    def create
        room = Room.create(room_params)
        if room.name 
            render json: room 
            else 
                render json: {message: "Please provide a name"}
            end 
    end

    def edit
        room = Room.find(params[:id])
        render json: room
    end

    def update
        room = Room.find(params[:id])
        room.update(room_params)
        render json: room
    end

    def destroy
        room = Room.find(params[:id])
        room.destroy
        render json: room
    end

    private

    def room_params
        params.require(:room).permit(:name, :user_id)
    end

end
