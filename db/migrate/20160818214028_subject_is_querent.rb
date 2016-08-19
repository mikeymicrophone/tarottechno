class SubjectIsQuerent < ActiveRecord::Migration
  def change
    rename_column :readings, :subject_id, :querent_id
  end
end
