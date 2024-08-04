class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :phone_number, :string
    add_column :users, :dob, :date
    add_column :users, :stripe_client_id, :string
    add_column :users, :role, :integer, default: 0, null: false
    add_column :users, :status, :integer, default: 0, null: false
  end
end
