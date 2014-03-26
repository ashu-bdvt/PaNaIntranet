class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :tasks, :timesheet_id, :project_effort_id
  end

  def down
  end
end
