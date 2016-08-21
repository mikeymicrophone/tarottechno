class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.belongs_to :line, foreign_key: true
      t.belongs_to :querent, foreign_key: true
      t.integer :ordering
      t.boolean :complete

      t.timestamps
    end
  end
end
