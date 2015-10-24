class TranslateTask < ActiveRecord::Base
  
  
  def get_possible_users
    @users = AvailableUser.get_users_with_language_strengths(source_language, source_language_strength,destination_language, destination_language_strength)
  end
  
  
  
  
end
