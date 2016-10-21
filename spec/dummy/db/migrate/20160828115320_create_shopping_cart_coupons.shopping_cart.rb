# This migration comes from shopping_cart (originally 20160828113507)
class CreateShoppingCartCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_coupons do |t|
      t.string :code
      t.integer :sale

      t.references :order
      
      t.timestamps
    end
  end
end
