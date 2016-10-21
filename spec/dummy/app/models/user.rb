class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  act_as_user

  def current_order
    orders.in_progress.first ||
      ShoppingCart::Order.create(user: self)
  end
end
