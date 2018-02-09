require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete product_url(products(:two))
    end

    assert_redirected_to products_url
  end
end
