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
  end
  
  test "there is only one user suited for this translate_task" do
    assert @translate_task.get_possible_users[0] == @user
  end
  
end
