require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#invoice" do
    get :invoice, format: :json, id: InvoiceItem.first.id
    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 100, invoice[:customer_id]
    assert_equal 1, invoice[:merchant_id]
    assert_equal "shipped", invoice[:status]
  end

  test "#item" do
    get :item, format: :json, id: InvoiceItem.first.id
    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 4, item[:id]
    assert_equal "Blah Blah", item[:name]
    assert_equal "Crieus jtheos kthneklsp.", item[:description]
    assert_equal "80888", item[:unit_price]
    assert_equal 2, item[:merchant_id]
  end
end
