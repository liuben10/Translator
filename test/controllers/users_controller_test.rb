require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @language_strength = language_strengths(:one)
    @language_strength.user_id = @user.id
  end
  
  test "should have a language strength associated with user" do
    @user.save
    @language_strength.save
    assert_not_empty @user.language_strengths
  end
  
  test "should delete language strengths" do 
    @user.save
    @language_strength.save
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.id
    end
    assert_empty @user.language_strengths
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { bio: @user.bio, name: @user.name, phone_number: @user.phone_number, rating: @user.rating }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { bio: @user.bio, name: @user.name, phone_number: @user.phone_number, rating: @user.rating }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
