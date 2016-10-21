module ShoppingCart
  module ActAsUser
    extend ActiveSupport::Concern

    module ClassMethods
      def act_as_user
        class_eval do
          has_many :orders, class_name: 'ShoppingCart::Order', as: :user
          delegate :in_progress, to: :orders, prefix: true
          delegate :in_queue, to: :orders, prefix: true
          delegate :in_delivery, to: :orders, prefix: true
          delegate :delivered, to: :orders, prefix: true
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ShoppingCart::ActAsUser)
