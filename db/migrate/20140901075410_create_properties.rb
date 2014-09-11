class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.string :postcode
      t.string :city
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
