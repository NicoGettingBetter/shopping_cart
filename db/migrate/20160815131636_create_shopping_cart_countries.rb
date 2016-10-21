class CreateShoppingCartCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_countries do |t|
      t.string :name

      t.timestamps
    end
  end
end
