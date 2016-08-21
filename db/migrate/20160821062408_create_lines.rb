class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :reader, foreign_key: true

      t.timestamps
    end
  end
end
