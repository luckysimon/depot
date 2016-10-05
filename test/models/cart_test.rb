require 'test_helper'
class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products
  test "Add unique products to cart" do
    product_a = products(:one)
    product_b = products(:two)
    cart = Cart.create
    cart.add_product(product_a.id).save!
    cart.add_product(product_b.id).save!
    assert_equal 2, cart.line_items.size
    assert_equal product_a.price+product_b.price, cart.total_price
  end

  test "Add duplicate products to cart" do
    product_a = products(:one)
    product_b = products(:one)
    cart = Cart.create
    cart.add_product(product_a.id).save!
    cart.add_product(product_b.id).save!
    assert_equal 1, cart.line_items.size
    assert_equal 2, cart.line_items.first.quantity
  end

end
