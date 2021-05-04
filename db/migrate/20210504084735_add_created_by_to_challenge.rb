class AddCreatedByToChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :created_by, :string, null: false, default: ""
  end
end
