class LoginController < ApplicationController

  def login
    puts "Login params = " + params.to_s
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
      render json: true, status: :ok
      return
    else
      render json: false, status: :unauthorized
      return
    end
  end
end