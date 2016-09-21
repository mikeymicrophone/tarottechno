class AvatarIfApproved < ActiveRecord::Migration[5.0]
  def change
    add_column :querents, :avatar_approved, :boolean, :default => :false
  end
end
