# encoding: utf-8
require 'rails_helper'

KNOWN_PORS_CONTROLLERS = [
  :airport,
  :bus,
  :heliport,
  :offline,
  :port,
  :railway
]

KNOWN_PORS_CONTROLLERS.each do |por_name|

  por_controller_class = TiRefdata.const_get("#{por_name.to_s.pluralize.camelize}Controller")
  por_names = por_name.to_s.pluralize

  describe por_controller_class do

    let!(:user) { Fabricate(:user) }
    let!(:country) { Fabricate(:country) }
    let!(:paris_cdg) { Fabricate(por_name) }
    let!(:bordeaux) { Fabricate(por_name, code: 'BOD', name: 'Bordeaux') }

    describe 'GET index with filter' do
      it 'returns our point of reference when authenticated' do
        sign_in user
        get :index, codes: 'CDG'
        expect(response.status).to eq(200)
        expect(first_json_at "$.#{por_names}").to have(1).por
        por_json = first_json_at "$.#{por_names}[0]"
        expect(por_json['id']).to eq('CDG')
        expect(por_json['code']).to eq('CDG')
        expect(por_json['name']).to eq('Paris - Charles-de-Gaulle')
        expect(por_json['country']['code']).to eq('FR')
        get :index, codes: 'BOD'
        expect(response.status).to eq(200)
        expect(first_json_at "$.#{por_names}").to have(1).por
        por_json = first_json_at "$.#{por_names}[0]"
        expect(por_json['id']).to eq('BOD')
        expect(por_json['code']).to eq('BOD')
        expect(por_json['name']).to eq('Bordeaux')
        expect(por_json['country']['code']).to eq('FR')
      end

      it 'returns our points of reference when authenticated' do
        sign_in user
        get :index, codes: 'CDG,BOD'
        expect(response.status).to eq(200)
        expect(first_json_at "$.#{por_names}").to have(2).por
        pors_json = first_json_at "$.#{por_names}"
        expect(pors_json[0]['id']).to eq('CDG')
        expect(pors_json[0]['code']).to eq('CDG')
        expect(pors_json[0]['name']).to eq('Paris - Charles-de-Gaulle')
        expect(pors_json[0]['country']['code']).to eq('FR')
        expect(pors_json[1]['id']).to eq('BOD')
        expect(pors_json[1]['code']).to eq('BOD')
        expect(pors_json[1]['name']).to eq('Bordeaux')
        expect(pors_json[1]['country']['code']).to eq('FR')
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
        expect(first_json_at "$.#{por_names}").to have(2).pors
      end
    end

    describe 'GET show' do
      it 'returns our point of reference when authenticated' do
        sign_in user
        get :show, id: 'CDG'
        por_json = first_json_at "$.#{por_name.to_s}"
        expect(por_json['id']).to eq('CDG')
        expect(por_json['code']).to eq('CDG')
        expect(por_json['name']).to eq('Paris - Charles-de-Gaulle')
        expect(por_json['country']['code']).to eq('FR')
        expect(response.status).to eq(200)
      end

      it 'fails when not found' do
        sign_in user
        get :show, id: 'not_here'
        expect(response.status).to eq(404)
      end

      it 'returns an error without authentication' do
        get :show, id: 'CDG'
        expect(response.status).to eq(401)
      end
    end

  end

end
