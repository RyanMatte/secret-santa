class AddInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :apartment_suite, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :postal_code, :string
  end
end
