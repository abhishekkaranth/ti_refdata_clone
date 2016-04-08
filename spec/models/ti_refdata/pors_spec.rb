require 'rails_helper'

describe TiRefdata::Airport do

  KNOWN_PORS = [
    :airport,
    :bus,
    :heliport,
    :offline,
    :port,
    :railway
  ]

  KNOWN_PORS.each do |por_name|

    context "using POR #{por_name}" do

      it 'persists to the store' do
        fr = TiRefdata::Country.new code: 'FR'
        fr.name = 'France'
        fr.save
        model_class = TiRefdata.const_get(por_name.to_s.camelize)
        cdg = model_class.new code: 'CDG'
        cdg.name = 'Paris - Charles-de-Gaulle'
        cdg.name_normalized = 'paris - charles-de-gaulle'
        cdg.latitude = 49.01278
        cdg.longitude = 2.55
        cdg.country = fr
        cdg.save
        c = model_class.find cdg.id
        expect(c.code).to eq('CDG')
        expect(c.name).to eq('Paris - Charles-de-Gaulle')
        expect(c.name_normalized).to eq('paris - charles-de-gaulle')
        expect(c.latitude).to eq(49.01278)
        expect(c.longitude).to eq(2.55)
        expect(c.country.code).to eq('FR')
        expect(c.country.name).to eq('France')
      end

    end

  end

end
