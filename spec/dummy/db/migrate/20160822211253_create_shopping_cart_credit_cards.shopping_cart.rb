# This migration comes from shopping_cart (originally 20160815132131)
class CreateShoppingCartCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_credit_cards do |t|
      t.string :number
      t.integer :cvv
      t.string :expiration_month
      t.integer :expiration_year

      t.references :order

      t.timestamps
    end
  end
end
