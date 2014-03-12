class ChangeColumnName < ActiveRecord::Migration

def change
rename_column :employees, :employee_id, :manager_id
end

end
