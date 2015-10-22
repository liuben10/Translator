class Utility
  
  def clean_methods_activerecord input
     input.class.methods - ActiveRecord::Base.methods
  end
  
  def clean_methods_object input
    input.class.methods - Object.methods
  end
  
  
  
end