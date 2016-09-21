class Avatars < ActiveRecord::Migration[5.0]
  def change
    add_column :readers, :avatar, :string
    add_column :querents, :avatar, :string
  end
end
