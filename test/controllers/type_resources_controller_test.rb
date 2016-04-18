require 'test_helper'

class TypeResourcesControllerTest < ActionController::TestCase
  setup do
    @type_resource = type_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_resource" do
    assert_difference('TypeResource.count') do
      post :create, type_resource: { code: @type_resource.code, movil: @type_resource.movil, name: @type_resource.name, pedagogic: @type_resource.pedagogic }
    end

    assert_redirected_to type_resource_path(assigns(:type_resource))
  end

  test "should show type_resource" do
    get :show, id: @type_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_resource
    assert_response :success
  end

  test "should update type_resource" do
    patch :update, id: @type_resource, type_resource: { code: @type_resource.code, movil: @type_resource.movil, name: @type_resource.name, pedagogic: @type_resource.pedagogic }
    assert_redirected_to type_resource_path(assigns(:type_resource))
  end

  test "should destroy type_resource" do
    assert_difference('TypeResource.count', -1) do
      delete :destroy, id: @type_resource
    end

    assert_redirected_to type_resources_path
  end
end
