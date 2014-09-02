class AddPropertyIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :property, index: true
  end
end
