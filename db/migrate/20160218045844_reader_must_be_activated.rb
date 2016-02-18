class ReaderMustBeActivated < ActiveRecord::Migration
  def change
    add_column :readers, :active, :boolean
  end
end
