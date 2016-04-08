class CreateNonAirportsPors < ActiveRecord::Migration

  NON_AIRPORTS_PORS = [
    :bus,
    :heliport,
    :offline,
    :port,
    :railway
  ]

  def change
    NON_AIRPORTS_PORS.each do |por_name|
      create_table por_name.to_s.pluralize.to_sym do |t|
        t.string :code, null: false
        t.string :name, null: true
        t.string :name_normalized, null: true
        t.float :latitude, null: true
        t.float :longitude, null: true
        t.float :page_rank, default: 0.0
        t.references :country
        t.references :city
      end
    end
  end

end
