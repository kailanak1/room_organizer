class Api::V1::ItemsController < ApplicationController
    
    def index
        items = Item.all
        render json: items
    end

    def show
        item = Item.find(params[:id])
        render json: item
    end

    def new
        item = Item.new
        if item.name 
            render json: item 
            else 
                render json: {message: "Please provide a name"}
            end 
    end

    def create
        item = Item.create(item_params)
        render json: item
    end

    def edit
        item = Item.find(params[:id])
        render json: item
    end

    def update
        item = Item.find(params[:id])
        item.update(item_params)
        render json: item
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy
        render json: {message: "Item successfully deleted"}
    end

    private

    def item_params
        params.require(:item).permit(:name, :category, :photo, :description, :storage_id, :quantity)
    end

end


