

class User < ActiveRecord::Base
  
  has_many :language_strengths, dependent: :destroy
  has_one :available_user, dependent: :destroy

  def make_available
    create_available_user
  end
  
  def make_unavailable
    available_user.destroy
  end
  
  def is_suitable_for_translation(source_language, source_strength, destination_language, destination_strength)
    source_strength_above_threshold = nil
    destination_strength_above_threshold = nil
   self.language_strengths.each do |language_strength|
     if !source_strength_above_threshold.nil? and !destination_strength_above_threshold.nil?
       return true
     end
      if language_strength.name == source_language
        if language_strength.strength > source_strength
          source_strength_above_threshold = language_strength
        end
      end
      if language_strength.name == destination_language
        if language_strength.strength > destination_strength
          destination_strength_above_threshold = language_strength
        end
      end
    end 
    if !source_strength_above_threshold.nil? and !destination_strength_above_threshold.nil?
       return true
    end
    return false
  end
  
  
  
end
