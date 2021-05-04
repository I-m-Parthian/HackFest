class AddEmpIdToCollaborate < ActiveRecord::Migration[5.1]
  def change
    add_column :collaborates, :emp_id, :string
  end
end
