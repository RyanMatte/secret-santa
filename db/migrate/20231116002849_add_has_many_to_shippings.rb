class AddHasManyToShippings < ActiveRecord::Migration[7.0]
  def change
    add_reference :shippings, :user, index: true 
  end
end
