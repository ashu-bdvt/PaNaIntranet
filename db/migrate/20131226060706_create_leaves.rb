class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.date :date
      t.integer :status
      t.integer :emp_id
      t.integer :leavetype_id
      t.text :comments

      t.timestamps
    end
  end
end
