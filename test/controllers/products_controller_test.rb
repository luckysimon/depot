#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
require 'test_helper'
class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title:       'Lorem Ipsum',
      description: 'Wibbles are fun!',
      image_url:   'lorem.jpg',
      price:       19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, params: {product: @update }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  # ...

  test "should show product" do
    get :show, params: {id: @product}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @product}
    assert_response :success
  end

  test "should update product" do
    patch :update, params: {id: @product, product: @update}
    assert_redirected_to product_path(assigns(:product))
  end

  # ...

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      
      delete :destroy, params: {id: @product}
    end

    assert_redirected_to products_path
  end

  # Chapter 8 Playtime
   test "should get index page" do
     # try get products/index
     get :index
     # assert success response
     assert_response :success
     # assert_select
     assert_select '.list_description',3
     assert_select 'dt',"Programming Ruby 1.9"
   end
end
