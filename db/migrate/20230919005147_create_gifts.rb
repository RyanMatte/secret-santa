class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|

      t.timestamps
    end
  end
end
