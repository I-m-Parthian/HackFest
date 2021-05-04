class CreateCollaborates < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborates do |t|
      t.references :challenge, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
