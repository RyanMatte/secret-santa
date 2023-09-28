class AddMatchedWithToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :matched_with, :string
  end
end
