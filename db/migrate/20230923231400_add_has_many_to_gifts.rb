class AddHasManyToGifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :gifts, :user, index: true 
  end
end
