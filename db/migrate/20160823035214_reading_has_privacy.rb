class ReadingHasPrivacy < ActiveRecord::Migration[5.0]
  def change
    add_column :readings, :private, :boolean, :default => false
  end
end
