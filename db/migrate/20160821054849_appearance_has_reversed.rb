class AppearanceHasReversed < ActiveRecord::Migration[5.0]
  def change
    add_column :appearances, :reversed, :boolean
  end
end
