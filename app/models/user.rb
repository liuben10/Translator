class User < ActiveRecord::Base
  
  has_many :language_strengths, dependent: :destroy
  
end
