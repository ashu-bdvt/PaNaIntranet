class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :id
      t.string :name
      t.string :client
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
