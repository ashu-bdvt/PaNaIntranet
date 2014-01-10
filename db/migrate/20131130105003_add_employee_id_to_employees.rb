class AddEmployeeIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :employee_id, :integer

  end
end
