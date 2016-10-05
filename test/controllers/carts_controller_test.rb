require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, params: { cart: {  } }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    # get cart_url(@cart)
    get :show ,params: {id: @cart}
    assert_response :success
  end

  test "should get edit" do
    # get edit_cart_url(@cart)
    get :edit , params: {id: @cart}
    assert_response :success
  end

  test "should update cart" do
    # patch cart_url(@cart), params: { cart: {  } }
    patch :update, params: {id: @cart,cart:{}}
    assert_redirected_to cart_url(@cart)
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      session[:cart_id] = @cart.id
      delete :destroy,params: {id:@cart}
    end
    assert_redirected_to store_url
    # assert_redirected_to carts_url
  end
end
