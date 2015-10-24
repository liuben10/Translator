require 'test_helper'

class TranslateTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  setup do
    @translate_task = translate_tasks(:english_3_to_spanish_3)
    @translate_task.save
    @user = users(:spanish_and_english)
    @unavailable_user = users(:one)
    @english_strength = language_strengths(:english_four) 
    @spanish_strength = language_strengths(:spanish_four)
    @english_strength.user_id = @user.id
    @spanish_strength.user_id = @user.id

  end
  
  test "Will find a single user with the necessary language strength" do
    @user.save
    @english_strength.save
    @spanish_strength.save
    @available_user = AvailableUser.create :user_id => @user.id
    @available_user.save
    assert @translate_task.get_possible_users.length == 1
  end
  
  
  test "Will only find an available user and not an unavailable user" do
    @user.save
    @english_strength.save
    @spanish_strength.save
    @available_user = AvailableUser.create :user_id => @user.id
    @available_user.save
    @unavailable_user.save
    assert @translate_task.get_possible_users.length == 1
  end
  
  

  
end
