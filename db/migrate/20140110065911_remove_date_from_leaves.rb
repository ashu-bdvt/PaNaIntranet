class RemoveDateFromLeaves < ActiveRecord::Migration
  def up
    remove_column :leaves, :date
      end

  def down
    add_column :leaves, :date, :date
  end
end
