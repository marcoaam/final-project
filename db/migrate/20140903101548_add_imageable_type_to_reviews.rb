class AddImageableTypeToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :imageable_type, :string
  end
end
