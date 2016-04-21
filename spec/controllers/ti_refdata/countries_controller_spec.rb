# encoding: utf-8
require 'rails_helper'

describe TiRefdata::CountriesController do

  let!(:user) { Fabricate(:user) }

  before do
    Fabricate(:country, code: 'FR', name: 'France', region: '44', latitude: 12.342, longitude: 34.6543)
    Fabricate(:country, code: 'QA', name: 'Qatar', region: '35', latitude: 42.975, longitude: 65.873)
  end

  describe 'GET index with filter' do
    it 'returns our country when authenticated' do
      sign_in user
      get :index, code: 'FR'
      expect(response.status).to eq(200)
      expect(first_json_at '$.countries').to have(1).country
      expect(first_json_at '$.countries[0].id').to eq('FR')
      expect(first_json_at '$.countries[0].code').to eq('FR')
      expect(first_json_at '$.countries[0].name').to eq('France')
      expect(first_json_at '$.countries[0].region').to eq('44')
      expect(first_json_at '$.countries[0].latitude').to eq(12.342)
      expect(first_json_at '$.countries[0].longitude').to eq(34.6543)
      get :index, code: 'QA'
      expect(response.status).to eq(200)
      expect(first_json_at '$.countries').to have(1).country
      expect(first_json_at '$.countries[0].id').to eq('QA')
      expect(first_json_at '$.countries[0].code').to eq('QA')
      expect(first_json_at '$.countries[0].name').to eq('Qatar')
      expect(first_json_at '$.countries[0].region').to eq('35')
      expect(first_json_at '$.countries[0].latitude').to eq(42.975)
      expect(first_json_at '$.countries[0].longitude').to eq(65.873)
    end

    it 'returns an error without authentication' do
      get :index
      expect(response.status).to eq(401)
    end
  end

  describe 'GET index without filter' do
    it 'returns an error' do
      sign_in user
      get :index
      expect(response.status).to eq(200)
      expect(first_json_at '$.countries').to have(2).countries
    end
  end
end
