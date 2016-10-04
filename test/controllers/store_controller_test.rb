require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_path
    assert_response :success
    # controller test code

    # selector start with # match on id ,while start with . match on class, start with no match element names

    # This aims to looks for at least 4 element named a, which is in an element with id 'side',which is in an element with id 'column'
    assert_select '#columns #side a', minimum: 4
    # Test there are 3 element with class= 'entry' in the main portion
    assert_select '#main .entry',3
    # Assert there exists one h3 element with the following name
    assert_select 'h3','Programming Ruby 1.9'
    # Assert the element with class='price' is formatted correctly
    assert_select '.price', /\$[,\d]+\.\d\d/
    # regular expression / / in this example it means start with $ with at least one number and the decimal point. and two decimal digits.

    # ========
    # The assert_select type depends on the second param. when number (3, minimum:4) it means quantity, when string, it means the exact value
    # when regular expression, it means the format.
    # ========



  end

  # Assertions are based on the test db data.
  # Controller test will not test the model created before.
end
