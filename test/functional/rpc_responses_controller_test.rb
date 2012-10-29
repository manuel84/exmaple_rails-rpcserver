require 'test_helper'

class RpcResponsesControllerTest < ActionController::TestCase
  setup do
    @rpc_response = rpc_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rpc_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rpc_response" do
    assert_difference('RpcResponse.count') do
      post :create, :rpc_response => { :methodName => @rpc_response.methodName, :params => @rpc_response.params, :request => @rpc_response.request, :response => @rpc_response.response }
    end

    assert_redirected_to rpc_response_path(assigns(:rpc_response))
  end

  test "should show rpc_response" do
    get :show, :id => @rpc_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rpc_response
    assert_response :success
  end

  test "should update rpc_response" do
    put :update, :id => @rpc_response, :rpc_response => { :methodName => @rpc_response.methodName, :params => @rpc_response.params, :request => @rpc_response.request, :response => @rpc_response.response }
    assert_redirected_to rpc_response_path(assigns(:rpc_response))
  end

  test "should destroy rpc_response" do
    assert_difference('RpcResponse.count', -1) do
      delete :destroy, :id => @rpc_response
    end

    assert_redirected_to rpc_responses_path
  end
end
