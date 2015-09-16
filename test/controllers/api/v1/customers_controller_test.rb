require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json
    customers = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Joey", customers.first[:first_name]
    assert_equal "Osinski", customers.last[:last_name]
  end

  test "#show" do
    get :show, format: :json, id: Customer.first.id
    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Cecelia", customer[:first_name]
    assert_equal "Osinski", customer[:last_name]
  end

  test "#find by id" do
    get :find, format: :json, id: Customer.first.id
    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Cecelia", customer[:first_name]
    assert_equal "Osinski", customer[:last_name]
  end

  test "#find by first name" do
    get :find, format: :json, first_name: Customer.first.first_name
    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Cecelia", customer[:first_name]
    assert_equal "Ondricka", customer[:last_name]
  end

  test "#find by last name" do
    get :find, format: :json, last_name: Customer.first.last_name
    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Cecelia", customer[:first_name]
    assert_equal "Osinski", customer[:last_name]
  end

  test "#find all by first_name" do
    get :find_all, format: :json, first_name: Customer.first.first_name
    customers = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal customers.first[:first_name], customers.second[:first_name]
    refute_equal customers.first[:last_name], customers.second[:last_name]
  end

  test "#find all by last_name" do
    get :find_all, format: :json, last_name: Customer.last.last_name
    customers = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    refute_equal customers.first[:first_name], customers.second[:first_name]
    assert_equal customers.first[:last_name], customers.second[:last_name]
  end

  test "#random" do
    get :random, format: :json
    JSON.parse(response.body)

    assert_response :success
  end
end
