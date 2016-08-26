module ShoppingCart
  module ActAsItem
    extend ActiveSupport::Concern

    module ClassMethods
      def act_as_item
        class_eval do
          has_many :order_items, class_name: 'ShoppingCart::OrderItem', as: :item
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ShoppingCart::ActAsItem)
