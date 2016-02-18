class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.belongs_to :tradition, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
