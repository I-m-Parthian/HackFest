class CreateUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :upvotes do |t|
      t.references :employee, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
