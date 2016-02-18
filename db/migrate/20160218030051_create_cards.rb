class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :deck, index: true, foreign_key: true
      t.string :name
      t.belongs_to :suit, index: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
