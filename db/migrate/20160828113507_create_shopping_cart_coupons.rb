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
