class CreateLogistics < ActiveRecord::Migration
  def change
    create_table :logistics do |t|
      t.string :name
      t.text :details
      t.timestamps null: false
    end
  end
end
