class CreateShoppingCartOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_orders do |t|
      t.string :state
      t.float :total_price
      t.datetime :completed_date

      t.references :user, polymorphic: true
      t.references :billing_address, foreign_key: true
      t.references :shipping_address, foreign_key: true
      t.references :coupon, foreign_key: true
      t.references :delivery, foreign_key: true

      t.timestamps
    end
  end
end
