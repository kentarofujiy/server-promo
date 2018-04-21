class InicioController < ApplicationController 
    def home
        @map_pois = Poi.all.page(params[:page]).per(4)


    end
    def about

    end

    def information
    end
end