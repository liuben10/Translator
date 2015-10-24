class AvailableUser < ActiveRecord::Base
  
  belongs_to :user
  
    def self.get_users_with_language_strengths(source_language, source_strength, destination_language, destination_strength)
     users = []
     AvailableUser.all.each do |available_user|
       user = User.find_by(id: available_user.user_id)     
       if (!user.nil? && user.is_suitable_for_translation(source_language, source_strength, destination_language, destination_strength))
         users << user
       end
     end
     return users
  end
end
