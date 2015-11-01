class TranslateTask < ActiveRecord::Base
  has_one :user, :through => :translator_id
  
  def get_possible_users
    @users = AvailableUser.get_users_with_language_strengths(source_language, source_language_strength,destination_language, destination_language_strength)
  end
  
  def assign_user_to_task(user_id)
    if User.find(user_id).availability == 1
       update(:translator_id => user_id)
    end
  end
  
end
