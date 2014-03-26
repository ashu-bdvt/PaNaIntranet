class RemoveProjectIdFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :project_id
      end

  def down
    add_column :tasks, :project_id, :integer
  end
end
