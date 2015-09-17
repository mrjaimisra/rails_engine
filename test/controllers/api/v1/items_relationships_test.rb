require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#invoice_items" do
    get :invoice_items, format: :json, id: Item.first.id
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, invoice_items.first[:id]
    assert_equal "1635", invoice_items.first[:unit_price]
    assert_equal 50, invoice_items.first[:quantity]
    assert_equal 14, invoice_items.first[:invoice_id]

    assert_equal 3, invoice_items.last[:id]
    assert_equal "13635", invoice_items.last[:unit_price]
    assert_equal 9, invoice_items.last[:quantity]
    assert_equal 1, invoice_items.last[:invoice_id]
  end

  test "#merchant" do
    get :merchant, format: :json, id: Item.first.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, merchant[:id]
    assert_equal "Schroeder-Jerde", merchant[:name]
  end
end