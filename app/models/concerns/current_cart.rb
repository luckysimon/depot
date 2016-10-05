module CurrentCart
  extend ActiveSupport::Concern

  private
  # Instance method provided to the class
  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
