class AddMyStepReferenceToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :shopping_cart_orders, :my_step, index: true
  end
end
