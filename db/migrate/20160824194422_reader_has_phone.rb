class ReaderHasPhone < ActiveRecord::Migration[5.0]
  def change
    add_column :readers, :phone, :string
  end
end
