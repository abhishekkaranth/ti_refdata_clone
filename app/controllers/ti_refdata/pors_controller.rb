module TiRefdata

  class PorsController < TiRefdata::ApplicationController
    ensure_signed_in

    def index
      if params[:codes]
        pors = params[:codes].split(',').map { |c| por_model_class.find_by_code c }.compact
      else
        pors = por_model_class.all
      end
      render json: pors, status: (pors.empty? ? 404 : 200)
    end

    def show
      por = por_model_class.find_by_code params[:id]
      if por
        render json: por
      else
        render json: {}, status: 404
      end
    end

  end

end
