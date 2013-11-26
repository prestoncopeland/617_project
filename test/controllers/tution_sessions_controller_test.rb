require 'test_helper'

class TutionSessionsControllerTest < ActionController::TestCase
  setup do
    @tution_session = tution_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tution_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tution_session" do
    assert_difference('TutionSession.count') do
      post :create, tution_session: { description: @tution_session.description, end_time: @tution_session.end_time, start_time: @tution_session.start_time, title: @tution_session.title, user_id: @tution_session.user_id }
    end

    assert_redirected_to tution_session_path(assigns(:tution_session))
  end

  test "should show tution_session" do
    get :show, id: @tution_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tution_session
    assert_response :success
  end

  test "should update tution_session" do
    patch :update, id: @tution_session, tution_session: { description: @tution_session.description, end_time: @tution_session.end_time, start_time: @tution_session.start_time, title: @tution_session.title, user_id: @tution_session.user_id }
    assert_redirected_to tution_session_path(assigns(:tution_session))
  end

  test "should destroy tution_session" do
    assert_difference('TutionSession.count', -1) do
      delete :destroy, id: @tution_session
    end

    assert_redirected_to tution_sessions_path
  end
end
