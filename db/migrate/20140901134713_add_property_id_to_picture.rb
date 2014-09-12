class AddPropertyIdToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :property, index: true
  end
end
