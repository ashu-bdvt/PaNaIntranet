class AddStatusColumnToLeavedays < ActiveRecord::Migration
  def change
    add_column :leavedays, :status, :boolean

  end
end
