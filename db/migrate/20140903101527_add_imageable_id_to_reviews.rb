class AddImageableIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :imageable_id, :integer
  end
end
