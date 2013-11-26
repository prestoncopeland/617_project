require 'test_helper'

class JournalCommentsControllerTest < ActionController::TestCase
  setup do
    @journal_comment = journal_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journal_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal_comment" do
    assert_difference('JournalComment.count') do
      post :create, journal_comment: { content: @journal_comment.content, entry_id: @journal_comment.entry_id, user_id: @journal_comment.user_id }
    end

    assert_redirected_to journal_comment_path(assigns(:journal_comment))
  end

  test "should show journal_comment" do
    get :show, id: @journal_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal_comment
    assert_response :success
  end

  test "should update journal_comment" do
    patch :update, id: @journal_comment, journal_comment: { content: @journal_comment.content, entry_id: @journal_comment.entry_id, user_id: @journal_comment.user_id }
    assert_redirected_to journal_comment_path(assigns(:journal_comment))
  end

  test "should destroy journal_comment" do
    assert_difference('JournalComment.count', -1) do
      delete :destroy, id: @journal_comment
    end

    assert_redirected_to journal_comments_path
  end
end
