class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :timesheet_id
      t.integer :time
      t.integer :project_id
      t.text :comment

      t.timestamps
    end
  end
end
