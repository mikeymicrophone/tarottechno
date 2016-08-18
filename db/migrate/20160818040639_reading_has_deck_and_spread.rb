class ReadingHasDeckAndSpread < ActiveRecord::Migration
  def change
    add_column :readings, :deck_id, :integer
    add_column :readings, :spread_id, :integer
  end
end
