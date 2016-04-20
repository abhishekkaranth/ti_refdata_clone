# encoding: utf-8

class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :code,     null: false
      t.string :name,     null: true
      t.decimal :latitude,   null: true
      t.decimal :longitude,  null: true
    end
  end
end
