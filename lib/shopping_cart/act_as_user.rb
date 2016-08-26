module ShoppingCart
  module ActAsUser
    extend ActiveSupport::Concern

    module ClassMethods
      def act_as_user
        class_eval do
          has_many :orders, class_name: 'ShoppingCart::Order', as: :user
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ShoppingCart::ActAsUser)
