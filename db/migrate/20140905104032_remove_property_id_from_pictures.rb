class RemovePropertyIdFromPictures < ActiveRecord::Migration
  def change
    remove_reference :pictures, :property, index: true
  end
end
