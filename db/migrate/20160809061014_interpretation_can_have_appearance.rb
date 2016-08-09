class InterpretationCanHaveAppearance < ActiveRecord::Migration
  def change
    add_column :interpretations, :appearance_id, :integer
  end
end
