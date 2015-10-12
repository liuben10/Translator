require 'test_helper'

class TranslateTasksControllerTest < ActionController::TestCase
  setup do
    @translate_task = translate_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:translate_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create translate_task" do
    assert_difference('TranslateTask.count') do
      post :create, translate_task: { country: @translate_task.country, destination_language: @translate_task.destination_language, name: @translate_task.name, owner_id: @translate_task.owner_id, source_language: @translate_task.source_language, translator_id: @translate_task.translator_id }
    end

    assert_redirected_to translate_task_path(assigns(:translate_task))
  end

  test "should show translate_task" do
    get :show, id: @translate_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @translate_task
    assert_response :success
  end

  test "should update translate_task" do
    patch :update, id: @translate_task, translate_task: { country: @translate_task.country, destination_language: @translate_task.destination_language, name: @translate_task.name, owner_id: @translate_task.owner_id, source_language: @translate_task.source_language, translator_id: @translate_task.translator_id }
    assert_redirected_to translate_task_path(assigns(:translate_task))
  end

  test "should destroy translate_task" do
    assert_difference('TranslateTask.count', -1) do
      delete :destroy, id: @translate_task
    end

    assert_redirected_to translate_tasks_path
  end
end
