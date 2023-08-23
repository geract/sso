class AddExtraFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, null: true
    add_column :users, :last_name, :string, null: true
    add_column :users, :username, :string, null: true
    add_column :users, :extra_information, :jsonb, default: {}
  end
end
