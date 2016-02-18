class CreateTraditions < ActiveRecord::Migration
  def change
    create_table :traditions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
