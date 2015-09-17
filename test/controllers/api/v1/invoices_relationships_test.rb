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

  test "#invoices" do
    skip
    get :invoices, format: :json, id: Invoice.first.id
    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoices.first[:id]
    assert_equal "shipped", invoices.first[:status]
    assert_equal 100, invoices.first[:customer_id]
    assert_equal 1, invoices.first[:merchant_id]

    assert_equal 2, invoices.last[:id]
    assert_equal "shipped", invoices.last[:status]
    assert_equal 200, invoices.last[:customer_id]
    assert_equal 1, invoices.last[:merchant_id]
  end
end
