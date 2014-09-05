class AddImageableIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :imageable_id, :integer
  end
end
