require 'test_helper'
require 'utility.rb'
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
  
  
  test "test users that are suited for tests" do
    assert User.get_users_with_language_strengths("English", 3, "Spanish", 3).length == 1
  end
  
  
end
