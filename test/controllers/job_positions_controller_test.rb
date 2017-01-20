require 'test_helper'

class JobPositionsControllerTest < ActionController::TestCase
  setup do
    @job_position = job_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_position" do
    assert_difference('JobPosition.count') do
      post :create, job_position: {  }
    end

    assert_redirected_to job_position_path(assigns(:job_position))
  end

  test "should show job_position" do
    get :show, id: @job_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_position
    assert_response :success
  end

  test "should update job_position" do
    patch :update, id: @job_position, job_position: {  }
    assert_redirected_to job_position_path(assigns(:job_position))
  end

  test "should destroy job_position" do
    assert_difference('JobPosition.count', -1) do
      delete :destroy, id: @job_position
    end

    assert_redirected_to job_positions_path
  end
end
