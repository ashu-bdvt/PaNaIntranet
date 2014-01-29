class RemoveStatusFromLeavedays < ActiveRecord::Migration
  def up
    remove_column :leavedays, :status
      end

  def down
    add_column :leavedays, :status, :boolean
  end
end
