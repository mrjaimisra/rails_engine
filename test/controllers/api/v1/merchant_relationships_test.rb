require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#items" do
    get :items, format: :json, id: Merchant.first.id
    items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Item Qui Esse", items.first[:name]
    assert_equal "Nihil autem sit odio inventore deleniti.", items.first[:description]
    assert_equal 75107, items.first[:unit_price]
    assert_equal 1, items.first[:merchant_id]

    assert_equal "Item Autem Minima", items.last[:name]
    assert_equal "Cumque consequuntur ad.", items.last[:description]
    assert_equal 67076, items.last[:unit_price]
    assert_equal 1, items.last[:merchant_id]
  end

  test "#invoices" do
    get :invoices, format: :json, id: Merchant.first.id
    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoices.first[:id]
    assert_equal "shipped", invoices.first[:status]
    assert_equal 1, invoices.first[:customer_id]
    assert_equal 1, invoices.first[:merchant_id]

    assert_equal 3, invoices.last[:id]
    assert_equal "not shipped", invoices.last[:status]
    assert_equal 2, invoices.last[:customer_id]
    assert_equal 1, invoices.last[:merchant_id]
  end
end
