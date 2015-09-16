require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json
    merchants = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Schroeder-Jerde", merchants.first[:name]
    assert_equal "Klein, Rempel and Jones", merchants.last[:name]
  end

  test "#show" do
    get :show, format: :json, id: Merchant.first.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Schroeder-Jerde", merchant[:name]
  end

  test "#find by id" do
    get :find, format: :json, id: Merchant.last.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Klein, Rempel and Jones", merchant[:name]
  end

  test "#find by first name" do
    get :find, format: :json, name: Merchant.first.name
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Schroeder-Jerde", merchant[:name]
  end

  test "#find all by name" do
    get :find_all, format: :json, name: Merchant.last.name
    merchants = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal merchants.first[:name], merchants.second[:name]
    refute_equal merchants.first[:id], merchants.second[:id]
  end

  test "#random" do
    #TODO
    get :random, format: :json
    JSON.parse(response.body)

    assert_response :success
  end
end
