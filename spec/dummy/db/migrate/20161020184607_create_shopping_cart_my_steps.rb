class CreateShoppingCartMySteps < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_my_steps do |t|

      t.timestamps
    end
  end
end
