# encoding: utf-8

module TiRefdata
  class CountrySerializer < ActiveModel::Serializer
    attributes :id, :code, :name, :latitude, :longitude, :region
    has_one :continent

    def id
      code
    end
  end
end
