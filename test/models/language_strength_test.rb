require 'test_helper'

class LanguageStrengthTest < ActiveSupport::TestCase
  setup do
    @english_strength1 = language_strengths(:english_four)
    @english_strength2 = language_strengths(:english_five)
    @english_strength3 = language_strengths(:english_six)
  end
  
  test "get_english_strengths_above_three" do
    assert_equal 3, (LanguageStrength.get_languages_above_strength("English", 3)).length
  end
 
end
