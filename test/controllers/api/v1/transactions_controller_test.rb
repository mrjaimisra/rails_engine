require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json
    transactions = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "4654405418249632", transactions.first[:credit_card_number]
    assert_equal "4580251236515200", transactions.last[:credit_card_number]
  end

  test "#show" do
    get :show, format: :json, id: Transaction.first.id
    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "4654405418249632", transaction[:credit_card_number]
  end

  test "#find by id" do
    get :find, format: :json, id: Transaction.last.id
    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "failed", transaction[:result]
  end

  test "#find by invoice_id" do
    get :find, format: :json, invoice_id: Transaction.first.invoice_id
    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, transaction[:id]
    assert_equal "success", transaction[:result]
  end

  test "#find by credit_card_number" do
    get :find, format: :json, credit_card_number: Transaction.first.credit_card_number
    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, transaction[:invoice_id]
    assert_equal "success", transaction[:result]
  end

  test "#find by result" do
    get :find, format: :json, result: Transaction.first.result
    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "4654405418249632", transaction[:credit_card_number]
  end

  test "#find all by invoice_id" do
    get :find_all, format: :json, invoice_id: Transaction.last.invoice_id
    transactions = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal transactions.first[:invoice_id], transactions.last[:invoice_id]
    refute_equal transactions.first[:id], transactions.last[:id]
  end

  test "#find all by credit_card_number" do
    get :find_all, format: :json, credit_card_number: Transaction.first.credit_card_number
    transactions = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal transactions.first[:credit_card_number], transactions.last[:credit_card_number]
    refute_equal transactions.first[:id], transactions.last[:id]
  end

  test "#find all by result" do
    get :find_all, format: :json, result: Transaction.first.result
    transactions = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal transactions.first[:result], transactions.last[:result]
    refute_equal transactions.first[:id], transactions.last[:id]
  end

  test "#random" do
    get :random, format: :json
    JSON.parse(response.body)

    assert_response :success
  end
end
