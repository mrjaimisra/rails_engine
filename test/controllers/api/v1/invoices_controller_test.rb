require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json
    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoices.first[:id]
    assert_equal "shipped", invoices.first[:status]
    assert_equal 200, invoices.last[:customer_id]
    assert_equal 3, invoices.last[:merchant_id]
  end

  test "#show" do
    get :show, format: :json, id: Invoice.first.id
    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice[:id]
  end

  test "#find by id" do
    get :find, format: :json, id: Invoice.last.id
    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 5, invoice[:id]
    assert_equal "not shipped", invoice[:status]
  end

  test "#find by status" do
    get :find, format: :json, status: Invoice.first.status
    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice[:id]
  end

  test "#find by customer_id" do
    get :find, format: :json, customer_id: Invoice.last.customer_id
    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, invoice[:id]
  end

  test "#find by merchant_id" do
    get :find, format: :json, merchant_id: Invoice.first.merchant_id
    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice[:id]
  end

  test "#find all by customer_id" do
    get :find_all, format: :json, customer_id: Invoice.last.customer_id
    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal invoices.first[:customer_id], invoices.last[:customer_id]
    refute_equal invoices.first[:id], invoices.last[:id]
  end

  test "#find all by merchant_id" do
    get :find_all, format: :json, merchant_id: Invoice.first.merchant_id
    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal invoices.first[:merchant_id], invoices.last[:merchant_id]
    refute_equal invoices.first[:id], invoices.last[:id]
  end

  test "#find all by status" do
    get :find_all, format: :json, status: Invoice.first.status
    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal invoices.first[:status], invoices.last[:status]
    refute_equal invoices.first[:id], invoices.last[:id]
  end

  test "#random" do
    get :random, format: :json
    JSON.parse(response.body)

    assert_response :success
  end
end
