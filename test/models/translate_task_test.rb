require 'test_helper'

class TranslateTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  setup do
    @translate_task = translate_tasks(:english_3_to_spanish_3)
    @translate_task.save
    @user = users(:spanish_and_english)
    @english_strength = language_strengths(:english_four) 
    @spanish_strength = language_strengths(:spanish_four)
    @english_strength.user_id = @user.id
    @spanish_strength.user_id = @user.id
    @user.save
    @english_strength.save
    @spanish_strength.save
    @available_user = AvailableUser.create :user_id => @user.id
    @available_user.save
  end
  
  test "Will find a single user with the necessary language strength" do
    assert @translate_task.get_possible_users.length == 1
  end
  

  
end
