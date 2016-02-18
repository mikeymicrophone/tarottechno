class CreateSuits < ActiveRecord::Migration
  def change
    create_table :suits do |t|
      t.string :name
      t.string :symbol

      t.timestamps null: false
    end
  end
end
