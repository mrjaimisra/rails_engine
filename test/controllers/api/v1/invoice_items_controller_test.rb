require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice_items.first[:id]
    assert_equal 5, invoice_items.first[:quantity]
    assert_equal 528, invoice_items.last[:item_id]
    assert_equal 2, invoice_items.last[:invoice_id]
    assert_equal 23324, invoice_items.last[:unit_price]
  end

  test "#show" do
    get :show, format: :json, id: InvoiceItem.first.id
    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice_item[:id]
  end

  test "#find by id" do
    get :find, format: :json, id: InvoiceItem.last.id
    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 3, invoice_item[:id]
    assert_equal 9, invoice_item[:quantity]
  end

  test "#find by quantity" do
    get :find, format: :json, quantity: InvoiceItem.first.quantity
    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice_item[:id]
  end

  test "#find by unit price" do
    get :find, format: :json, unit_price: InvoiceItem.last.unit_price
    invoice_item = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
    assert_equal 3, invoice_item[:id]
  end

  test "#find by item_id" do
    get :find, format: :json, item_id: InvoiceItem.first.item_id
    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice_item[:id]
  end

  test "#find by invoice_id" do
    get :find, format: :json, invoice_id: InvoiceItem.last.invoice_id
    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 3, invoice_item[:id]
  end

  test "#find all by quantity" do
    get :find_all, format: :json, quantity: InvoiceItem.last.quantity
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal invoice_items.first[:quantity], invoice_items.last[:quantity]
    refute_equal invoice_items.first[:id], invoice_items.last[:id]
  end

  test "#find all by unit price" do
    get :find_all , format: :json, unit_price: InvoiceItem.first.unit_price
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal invoice_items.first[:unit_price], invoice_items.last[:unit_price]
    refute_equal invoice_items.first[:id], invoice_items.last[:id]
  end

  test "#find all by item_id" do
    get :find_all, format: :json, item_id: InvoiceItem.last.item_id
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal invoice_items.first[:item_id], invoice_items.second[:item_id]
    refute_equal invoice_items.first[:id], invoice_items.second[:id]
  end

  test "#find all by invoice_id" do
    get :find_all, format: :json, invoice_id: InvoiceItem.first.invoice_id
    invoice_items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal invoice_items.first[:invoice_id], invoice_items.second[:invoice_id]
    refute_equal invoice_items.first[:id], invoice_items.second[:id]
  end

  test "#random" do
    get :random, format: :json
    JSON.parse(response.body)

    assert_response :success
  end
end
