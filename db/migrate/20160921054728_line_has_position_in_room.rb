class LineHasPositionInRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :lines, :position_in_room, :string
  end
end
