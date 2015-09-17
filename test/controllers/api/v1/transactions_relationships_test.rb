require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#invoice" do
    get :invoice, format: :json, id: InvoiceItem.first.id
    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 100, invoice[:customer_id]
    assert_equal 1, invoice[:merchant_id]
    assert_equal "shipped", invoice[:status]
  end
end
