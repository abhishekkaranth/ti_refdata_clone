class AddContinentsToCountries < ActiveRecord::Migration
  def change
    add_reference :countries, :continent
  end
end
