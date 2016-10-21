# This migration comes from shopping_cart (originally 20160815131636)
class CreateShoppingCartCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_countries do |t|
      t.string :name

      t.timestamps
    end
  end
end
