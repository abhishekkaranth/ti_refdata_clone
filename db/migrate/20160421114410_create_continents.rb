class CreateContinents < ActiveRecord::Migration
  def change
    create_table :continents do |t|
      t.string :code, null: false
      t.string :name, null: true
      t.string :name_normalized, null: true
      t.decimal :latitude, null: true
      t.decimal :longitude, null: true
    end
  end
end
