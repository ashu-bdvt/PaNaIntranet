class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :id
      t.string :name
      t.string :designation
      t.date :date_of_joining
      t.integer :contact_number
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
