#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, product_id: products(:ruby).id
    end

    assert_redirected_to store_url
  end

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { product_id: @line_item.product_id }
    assert_redirected_to store_url
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end
    assert_redirected_to store_url
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      post :create, params: {product_id: products(:ruby).id},
      xhr: true
      # xhr stands for XMLHttpRequest
    end
    assert_response :success
    # extract the jquery response
    # search in the element with id cart
    assert_select_jquery :html,'#cart' do
      # we hope the element in <tr id= "current_item"> include <td> with content "Programming Ruby 1.9", means we successfully add the line_item with the product(:ruby).
      assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end



end
