class AddColumnPageRankToContinents < ActiveRecord::Migration
  def change
    add_column :continents, :page_rank, :float, default: 0
  end
end
