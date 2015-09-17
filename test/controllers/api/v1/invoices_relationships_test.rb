require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#transactions" do
    get :transactions, format: :json, id: Invoice.first.id
    transactions = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "4654405418249632", transactions.first[:credit_card_number]
    assert_equal "success", transactions.first[:result]
    assert_equal 1, transactions.first[:invoice_id]

    assert_equal "4580251236515200", transactions.last[:credit_card_number]
    assert_equal "failed", transactions.last[:result]
    assert_equal 1, transactions.last[:invoice_id]
  end

  test "#invoice_items" do
    get :invoice_items, format: :json, id: Invoice.first.id
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice_items.first[:id]
    assert_equal "13635", invoice_items.first[:unit_price]
    assert_equal 5, invoice_items.first[:quantity]
    assert_equal 1, invoice_items.first[:invoice_id]

    assert_equal 3, invoice_items.last[:id]
    assert_equal "13635", invoice_items.last[:unit_price]
    assert_equal 9, invoice_items.last[:quantity]
    assert_equal 1, invoice_items.last[:invoice_id]
  end

  test "#items" do
    get :items, format: :json, id: Invoice.first.id
    items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, items.first[:id]
    assert_equal "Item Qui Esse", items.first[:name]
    assert_equal "Nihil autem sit odio inventore deleniti.", items.first[:description]
    assert_equal "75107", items.first[:unit_price]
    assert_equal 1, items.first[:merchant_id]

    assert_equal 4, items.last[:id]
    assert_equal "Blah Blah", items.last[:name]
    assert_equal "Crieus jtheos kthneklsp.", items.last[:description]
    assert_equal "80888", items.last[:unit_price]
    assert_equal 2, items.last[:merchant_id]
  end

  test "#customer" do
    get :customer, format: :json, id: Invoice.first.id
    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 100, customer[:id]
    assert_equal "Cecelia", customer[:first_name]
    assert_equal "Osinski", customer[:last_name]
  end

  test "#merchant" do
    get :merchant, format: :json, id: Invoice.first.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, merchant[:id]
    assert_equal "Schroeder-Jerde", merchant[:name]
  end
end
