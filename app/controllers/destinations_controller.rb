class DestinationsController < ApplicationController

    def show
        @destination = Destination.find_by(id: params[:id])
    end

    def index
        @destinations = Destination.all
    end
    
end