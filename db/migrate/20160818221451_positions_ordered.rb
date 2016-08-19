class PositionsOrdered < ActiveRecord::Migration
  def change
    add_column :positions, :ordering, :integer
    rename_column :cards, :order, :ordering
  end
end
