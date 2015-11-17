module LoginHelper
  
  def save_access_token(access_token)
    cookies[access_token] = {value: access_token, expires: Time.now() + 3600}
  end
  
  def authenticated?(access_token)
    !cookies[access_token].nil?
  end
end