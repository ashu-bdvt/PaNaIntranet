class RemoveStatusFromLeaves < ActiveRecord::Migration
  def up
    remove_column :leaves, :status
      end

  def down
    add_column :leaves, :status, :integer
  end
end
