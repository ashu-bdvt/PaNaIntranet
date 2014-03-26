class CreateProjectEfforts < ActiveRecord::Migration
  def change
    create_table :project_efforts do |t|
      t.integer :project_id
      t.integer :timesheet_id

      t.timestamps
    end
  end
end
