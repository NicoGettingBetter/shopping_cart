class CreateShoppingCartOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_order_items do |t|
      t.float :price
      t.integer :quantity

      t.references :order
      #t.references :item, polymorphic: true

      t.timestamps
    end
  end
end
