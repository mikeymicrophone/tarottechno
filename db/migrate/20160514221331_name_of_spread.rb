class NameOfSpread < ActiveRecord::Migration
  def change
    add_column :spreads, :name, :string
  end
end
