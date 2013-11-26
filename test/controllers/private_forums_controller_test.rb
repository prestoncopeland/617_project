require 'test_helper'

class PrivateForumsControllerTest < ActionController::TestCase
  setup do
    @private_forum = private_forums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:private_forums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create private_forum" do
    assert_difference('PrivateForum.count') do
      post :create, private_forum: { accept: @private_forum.accept, tution_session_id: @private_forum.tution_session_id, user_id: @private_forum.user_id }
    end

    assert_redirected_to private_forum_path(assigns(:private_forum))
  end

  test "should show private_forum" do
    get :show, id: @private_forum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @private_forum
    assert_response :success
  end

  test "should update private_forum" do
    patch :update, id: @private_forum, private_forum: { accept: @private_forum.accept, tution_session_id: @private_forum.tution_session_id, user_id: @private_forum.user_id }
    assert_redirected_to private_forum_path(assigns(:private_forum))
  end

  test "should destroy private_forum" do
    assert_difference('PrivateForum.count', -1) do
      delete :destroy, id: @private_forum
    end

    assert_redirected_to private_forums_path
  end
end
