class AddContinentsToCountries < ActiveRecord::Migration
  def change
    add_reference :countries, :continents, foreign_key: true
  end
end
