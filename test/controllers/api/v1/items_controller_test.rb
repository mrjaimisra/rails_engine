require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json
    items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Item Qui Esse", items.first[:name]
    assert_equal "Nihil autem sit odio inventore deleniti.", items.first[:description]
    assert_equal "Blah Blah", items.last[:name]
    assert_equal "Crieus jtheos kthneklsp.", items.last[:description]
  end

  test "#show" do
    get :show, format: :json, id: Item.first.id
    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Item Qui Esse", item[:name]
  end

  test "#find by id" do
    get :find, format: :json, id: Item.last.id
    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Blah Blah", item[:name]
  end

  test "#find by name" do
    get :find, format: :json, name: Item.first.name
    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Item Qui Esse", item[:name]
  end

  test "#find by description" do
    get :find, format: :json, description: Item.first.description
    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Item Qui Esse", item[:name]
  end

  test "#find by unit_price" do
    get :find, format: :json, unit_price: Item.first.unit_price
    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Item Qui Esse", item[:name]
  end

  test "#find by merchant_id" do
    get :find, format: :json, merchant_id: Item.last.merchant_id
    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Blah Blah", item[:name]
  end

  test "#find_all by name" do
    get :find_all, format: :json, name: Item.first.name
    items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal items.first[:name], items.second[:name]
    refute_equal items.first[:id], items.second[:id]
  end

  test "#find all by description" do
    get :find_all, format: :json, description: Item.first.description
    items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal items.first[:description], items.second[:description]
    refute_equal items.first[:id], items.second[:id]
  end

  test "#find all by unit price" do
    get :find_all, format: :json, unit_price: Item.first.unit_price
    items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal items.first[:unit_price], items.last[:unit_price]
    refute_equal items.first[:id], items.second[:id]
  end

  test "#find all by merchant_id" do
    get :find_all, format: :json, merchant_id: Item.first.merchant_id
    items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal items.first[:merchant_id], items.first[:merchant_id]
    refute_equal items.first[:id], items.last[:id]
    refute_equal items.first[:name], items.last[:name]
  end

  test "#random" do
    get :random, format: :json
    JSON.parse(response.body)

    assert_response :success
  end
end
