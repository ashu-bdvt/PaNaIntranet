class CreateLeavedays < ActiveRecord::Migration
  def change
    create_table :leavedays do |t|
      t.date :date
      t.integer :leave_id

      t.timestamps
    end
  end
end
