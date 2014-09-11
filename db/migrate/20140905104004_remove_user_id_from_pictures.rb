class RemoveUserIdFromPictures < ActiveRecord::Migration
  def change
    remove_reference :pictures, :user, index: true
  end
end
