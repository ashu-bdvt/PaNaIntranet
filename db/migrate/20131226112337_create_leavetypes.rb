class CreateLeavetypes < ActiveRecord::Migration
  def change
    create_table :leavetypes do |t|
      t.string :name
      t.integer :max_leaves

      t.timestamps
    end
  end
end
