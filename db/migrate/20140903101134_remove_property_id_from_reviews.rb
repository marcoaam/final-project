class RemovePropertyIdFromReviews < ActiveRecord::Migration
  def change
    remove_reference :reviews, :property, index: true
  end
end
