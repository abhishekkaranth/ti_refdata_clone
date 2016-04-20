# encoding: utf-8

module TiRefdata
  class Country < ActiveRecord::Base
    attr_accessible :code, :name, :name_normalized, :latitude, :longitude, :region, :page_rank

    has_many :cities
  end
end
