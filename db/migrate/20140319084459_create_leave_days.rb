class CreateLeaveDays < ActiveRecord::Migration
  def change
    create_table :leave_days do |t|
      t.date :date
      t.integer :leave_id
      t.integer :status

      t.timestamps
    end
  end
end
