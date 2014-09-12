class AddPropertyIdToRoom < ActiveRecord::Migration
  def change
    add_reference :rooms, :property, index: true
  end
end
