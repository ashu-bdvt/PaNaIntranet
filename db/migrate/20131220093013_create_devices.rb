class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_name
      t.string :model
      t.string :serial_no
      t.float :unit_price
      t.integer :quantity
      t.date :calibration_due_date
      t.date :received_date
      t.date :shipped_date
      t.text :comments
      t.boolean :status
      t.integer :owner_id
      t.integer :project_id

      t.timestamps
    end
  end
end
