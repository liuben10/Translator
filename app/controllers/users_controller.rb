class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_if_authenticated, only: [:get_languages_for_user]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: {user: @user, language_strengths: @user.language_strengths}
  end
  
  
  def get_languages_for_user
    @user = User.find(params[:id])
    if (@user.nil?)
      render :show, status: :not_found
    end
    render json: @user.language_strengths
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    if(request.headers["Content-type"].nil?)
       render status: :unsupported_media_type
    end
    salt = User.generate_salt
    encrypted_password = User.encrypt_password user_params[:password], salt
    user = {name: user_params[:name],
       phone_number: user_params[:phone_number],
       rating: user_params[:rating],
       bio: user_params[:bio],
       created_at: Time.now,
       updated_at: Time.now,
       available: 0,
       email: user_params[:email],
       password: encrypted_password,
       salt: salt,
       country: user_params[:country]}
    @user = User.new(user)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_if_authenticated
    authorization_header = request.headers["Authorization"]
    if authenticated?(authorization_header)
      render json: {message: "unauthorized"}, status: :unauthorized
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def login_params
      params.permit(:email, :password)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      puts params
      params.require(:user).permit(:name, :phone_number, :rating, :bio, :email, :country, :password, :salt)
    end
end
