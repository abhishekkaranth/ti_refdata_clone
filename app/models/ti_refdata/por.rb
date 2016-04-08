module TiRefdata

  module Por

    # Add ActiveRecord relations of any POR to any class including this module
    def self.included(c)
      c.class_eval do
        attr_accessible :code, :name, :name_normalized, :latitude, :longitude, :page_rank

        belongs_to :city
        belongs_to :country
      end
    end

  end

end
