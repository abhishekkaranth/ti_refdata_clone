# encoding: utf-8
require 'rails_helper'

describe TiRefdata::Country do
  it 'persists to the store' do
    c0 = TiRefdata::Country.new code: 'FR'
    c0.name = 'France'
    c0.name_normalized = 'france'
    c0.region = '44'
    c0.latitude = 12.2345
    c0.longitude = 43.7654
    c0.save
    c = TiRefdata::Country.find c0.id
    expect(c.code).to eq('FR')
    expect(c.name).to eq('France')
    expect(c.name_normalized).to eq('france')
    expect(c.region).to eq('44')
    expect(c.latitude).to eq(12.2345)
    expect(c.longitude).to eq(43.7654)
  end
end
