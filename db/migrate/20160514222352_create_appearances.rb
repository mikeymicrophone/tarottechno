class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.belongs_to :reading, index: true, foreign_key: true
      t.belongs_to :card, index: true, foreign_key: true
      t.belongs_to :position, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
