class AddFieldsToGifts < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :name, :string
    add_column :gifts, :url, :string
    add_column :gifts, :notes, :string
  end
end
