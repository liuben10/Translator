require 'test_helper'
class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:spanish_and_english)
    @english_strength = language_strengths(:english_four) 
    @spanish_strength = language_strengths(:spanish_four)
    @english_strength.user_id = @user.id
    @spanish_strength.user_id = @user.id
    @user.save
    @english_strength.save
    @spanish_strength.save
    @weak_user = users(:one)
    @english_strength_weaker = language_strengths(:english_one)
    @spanish_strength_weaker = language_strengths(:spanish_one)
    @english_strength_weaker.user_id = @weak_user.id
    @spanish_strength_weaker.user_id = @weak_user.id
    @weak_user.save
    @english_strength_weaker.save
    @spanish_strength_weaker.save
    
  end
  
  test "test will make sure user qualifies for test" do
    assert @user.is_suitable_for_translation "English", 3, "Spanish", 3
  end
  
  test "test user is not suited for test" do
    assert !@user.is_suitable_for_translation("English", 5, "Spanish", 5)
  end
  
  test "make user available" do
    @user.make_available
    assert_not_nil AvailableUser.find_by_user_id(@user.id)
  end
  
  test "destroy user" do
    @user.make_available
    @user.make_unavailable
    assert_nil AvailableUser.find_by_user_id(@user.id)
  end
  
  
  test "destroy user will remove availability" do
    @user.make_available
    @user.destroy
    assert_nil AvailableUser.find_by_user_id(@user.id)
  end
  
end
