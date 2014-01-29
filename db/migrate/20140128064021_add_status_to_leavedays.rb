class AddStatusToLeavedays < ActiveRecord::Migration
  def change
    add_column :leavedays, :status, :integer

  end
end
