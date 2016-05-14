class CreateSpreads < ActiveRecord::Migration
  def change
    create_table :spreads do |t|
      t.belongs_to :tradition, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
