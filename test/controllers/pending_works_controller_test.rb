require 'test_helper'

class PendingWorksControllerTest < ActionController::TestCase
  setup do
    @pending_work = pending_works(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pending_works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pending_work" do
    assert_difference('PendingWork.count') do
      post :create, pending_work: { description: @pending_work.description, project_id: @pending_work.project_id, starting_time: @pending_work.starting_time, user_id: @pending_work.user_id }
    end

    assert_redirected_to pending_work_path(assigns(:pending_work))
  end

  test "should show pending_work" do
    get :show, id: @pending_work
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pending_work
    assert_response :success
  end

  test "should update pending_work" do
    patch :update, id: @pending_work, pending_work: { description: @pending_work.description, project_id: @pending_work.project_id, starting_time: @pending_work.starting_time, user_id: @pending_work.user_id }
    assert_redirected_to pending_work_path(assigns(:pending_work))
  end

  test "should destroy pending_work" do
    assert_difference('PendingWork.count', -1) do
      delete :destroy, id: @pending_work
    end

    assert_redirected_to pending_works_path
  end
end
