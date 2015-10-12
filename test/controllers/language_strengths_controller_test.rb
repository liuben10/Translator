require 'test_helper'

class LanguageStrengthsControllerTest < ActionController::TestCase
  setup do
    @language_strength = language_strengths(:one)
    @language_strength2 = language_strengths(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:language_strengths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create language_strength" do
    assert_difference('LanguageStrength.count') do
      post :create, language_strength: { name: "some_language", strength: 3, user_id: 1 }
    end

    assert_redirected_to language_strength_path(assigns(:language_strength))
  end

  test "should show language_strength" do
    get :show, id: @language_strength
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @language_strength
    assert_response :success
  end

  test "should update language_strength" do
    patch :update, id: @language_strength, language_strength: { name: @language_strength.name, strength: @language_strength.strength, user_id: @language_strength.user_id }
    assert_redirected_to language_strength_path(assigns(:language_strength))
  end

  test "should destroy language_strength" do
    assert_difference('LanguageStrength.count', -1) do
      delete :destroy, id: @language_strength
    end

    assert_redirected_to language_strengths_path
  end
end
