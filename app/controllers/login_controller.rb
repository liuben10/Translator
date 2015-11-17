class LoginController < ApplicationController

  def login
    puts "Login params = " + params.to_s
    if(request.headers["Content-type"].nil?)
       render status: :unsupported_media_type
    end
    if (params[:email].nil? || params[:password].nil?)
       render json: false, status: :unauthorized
       return
    end
    @user = User.find_by_email(params[:email])
    if (@user.nil?)
      render json: false, status: :not_found
      return
    end
    salted_and_hashed = User.encrypt_password(params[:password], @user[:salt])
    puts "salted_and_hashed = " + salted_and_hashed.to_s + ", password = " + @user.password.to_s
    if (salted_and_hashed ==@user.password)
      access_token = User.generate_salt
      save_access_token access_token #generate some random string for now just for some easy authentication. Would need to investigate more on how to make more sophisticated.
      cookies.each do |cookie|
        puts cookie
      end
      render json: {user_id: @user.id, access_token: access_token}, status: :ok
      return
    else
      render json: false, status: :unauthorized
      return
    end
  end
end