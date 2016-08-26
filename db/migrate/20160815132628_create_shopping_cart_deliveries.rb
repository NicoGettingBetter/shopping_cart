class CreateShoppingCartDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_deliveries do |t|
      t.string :company
      t.string :delivery_method
      t.float :price

      t.timestamps
    end
  end
end
