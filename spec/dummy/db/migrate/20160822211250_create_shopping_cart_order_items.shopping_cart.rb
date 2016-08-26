# This migration comes from shopping_cart (originally 20160815131450)
class CreateShoppingCartOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_order_items do |t|
      t.float :price
      t.integer :quantity

      t.references :order, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
