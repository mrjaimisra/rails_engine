# test "#show" do
#   get :show, format: :json, id: Item.first.id
#
# end
#
# test "#create" do
#   item_params = { name: "Arya" description: "Is not blind" }
#
#   post :create, format: :json, item: item_params
#
#   item      = Item.last
#   json_item = JSON.parse(response.body, symbolize_names: true)
#
#   assert_response :success
#   assert_equal "Arya", item.name
#   assert_equal "Is not blind", item.description
#   assert_equal "Arya", json_item[:name]
#   assert_equal "Is not blind", json_item[:description]
# end
#
# test "#update" do
#   item_params     = { name: "Arya", description: "Is not blind" }
#   old_item        = Item.first
#
#   put :update, format: :json, id: old_item.id, item: item_params
#
#   new_item        = Item.find(old_item.id)
#
#   assert_response                      :success
#   assert_equal "Arya"               ,  new_item.name
#   assert_eqaul "Is not blind"       ,  new_item.description
#   refute_equal old_item.name        ,  new_item.name
#   refute_equal old_item.description ,  new_item.description
# end
#
# test "#destroy" do
#   assert_difference("Item.count", -1) do
#     delete :destroy, format: :json, id: Item.first.id
#   end
#
#   assert_response :success
#
# end
