class ConvertGeoCoordToFloat < ActiveRecord::Migration
  def up
    change_column :cities, :latitude, :float
    change_column :cities, :longitude, :float
    change_column :airports, :latitude, :float
    change_column :airports, :longitude, :float
    change_column :countries, :longitude, :float
    change_column :countries, :longitude, :float
  end

  def down
    change_column :cities, :latitude, :decimal
    change_column :cities, :longitude, :decimal
    change_column :airports, :latitude, :decimal
    change_column :airports, :longitude, :decimal
    change_column :countries, :longitude, :decimal
    change_column :countries, :longitude, :decimal
  end
end
