class CreateShoppingCartOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_orders do |t|
      t.string :state, default: 'in_progress'
      t.float :total_price
      t.datetime :completed_date

      t.references :user, polymorphic: true
      t.references :billing_address
      t.references :shipping_address
      t.references :delivery

      t.timestamps
    end
  end
end
