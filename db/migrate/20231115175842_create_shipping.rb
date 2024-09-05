class CreateShipping < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.timestamps
      t.string :status
      t.boolean :received, :default => 0
      t.string :name_on_package
      t.date :shipped_at
      t.date :expected_at
    end
  end
end
