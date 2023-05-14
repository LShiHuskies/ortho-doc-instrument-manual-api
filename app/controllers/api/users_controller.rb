class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :requires_login, only: [:index, :show, :edit, :update, :destroy]
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    render json: @users, include: :messages
    # render json: UserSerializer.new(@users).serializable_hash[:data][:attributes]
  end

  def show
    @user = User.find(params[:id])
    # @user = User.find(params[:id]).to_json(include: [:avatar])
    # @avatar = rails_blob_path(user.avatar)
    render json: @user, include: :messages
    # render json: UserSerializer.new(@user).serializable_hash[:data][:attributes]
  end

  def new
    @user = User.new
    render json: @user
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:avatar])
    if @user.save
      # render json: @user
      render json: {
        token: get_token(payload(@user.username, @user.id)),
        user: @user
      }
    else
      render json: @user.errors.full_messages
    end
  end

def show
  if !authorized(@user)
    render json: { message: 'Off Limits' }, status: :unauthorized
  else
    render json: @user
  end
end

def edit
  render json: @user
end

def update
  if @user.update(user_params) && authorized(@user)
    render json: @user
  else
    render json: { message: 'Wrong!' }, status: :unauthorized
  end
end

def destroy
  if authorized(@user)
    render json: @user.destroy
  else
    render json: { message: 'Wrong!' }, status: :unauthorized
  end
end

private
  
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :email, :bio, :avatar)
  end

  def get_user
    @user = User.find(params[:id])
  end

  
end
