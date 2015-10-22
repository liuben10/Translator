class LanguageStrength < ActiveRecord::Base
  
  belongs_to :user
  
  def self.get_languages_above_strength(source_language, strength)
    return LanguageStrength.where("name = '" + source_language + "' and strength > " + strength.to_s).order(:strength).reverse_order
  end
  
end
