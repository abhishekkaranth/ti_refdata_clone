# encoding: utf-8

module TiRefdata
  class ContinentsController < TiRefdata::ApplicationController
    ensure_signed_in

    def index
      continents = if params[:code]
                    continent = Continent.find_by_code params[:code]
                    continent ? [continent] : []
                  else
                    Continent.all
                  end

      render json: continents, status: (continents.empty? ? 404 : 200)
    end

    def show
      continent = Continent.find_by_code params[:id]
      if continent
        render json: continent
      else
        render json: {}, status: 404
      end
    end
  end
end
