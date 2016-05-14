class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :reader, index: true, foreign_key: true
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
