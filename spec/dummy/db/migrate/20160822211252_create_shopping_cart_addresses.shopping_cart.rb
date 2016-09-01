# This migration comes from shopping_cart (originally 20160815131934)
class CreateShoppingCartAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.integer :zipcode
      t.string :city
      t.string :phone

      t.references :country

      t.timestamps
    end
  end
end
