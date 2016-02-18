class CreateInterpretations < ActiveRecord::Migration
  def change
    create_table :interpretations do |t|
      t.belongs_to :card, index: true, foreign_key: true
      t.string :phrase
      t.text :description
      t.belongs_to :reader, index: true

      t.timestamps null: false
    end
  end
end
