require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "ABC", description: "Test", image_url: "xxx.jpg")
    # test price cases
    product.price = -1
    # assert_equal a,b
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?

  end


  # custom method for test case

  def new_product(image_url)
    Product.new(title: "Book Title", description: "My Description", price: 100, image_url: image_url
    )
  end

  test "product image url should be specific format" do
    ok =%w{a.gif a.jpg a.png A.JPG B.Jpg http://a.b.c/e/f/g/a.gif}
    bad = %w{a.doc b.jpg/ttt c.jpg.yyy}
    ok.each do |name|
      # assert condition==true,[option]"custom valid message"
      assert new_product(name).valid?, "#{name} should be valid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end


  # Using fixtures db to test
  test "product is not valid without a unique title" do
    product = Product.new(title: products(:ruby).title,
                          description: "yyy",
                          price: 1,
                          image_url: "fred.gif")
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  #TODO need to see in chapter 15
  test "product is not valid without a unique title - i18n" do
    product = Product.new(title: products(:ruby).title,
                          description: "yyy",
                          price: 1,
                          image_url: "fred.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:title]
  end
end
