class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def add_book
    ShoppingCart::OrderItem.create( item: book,
                                    order_id: current_order.id,
                                    quantity: 1,
                                    price: book.price)
    redirect_back(fallback_location: root_path)
  end

  private
    def book
      Book.find(params[:book_id])
    end
end
