class AddEmpIdToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :emp_id, :string, null: false, default: ""
  end
end
