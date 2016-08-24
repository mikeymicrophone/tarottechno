class QuerentPhone < ActiveRecord::Migration[5.0]
  def change
    add_column :querents, :phone, :string
    add_column :readers, :phone, :string
  end
end
