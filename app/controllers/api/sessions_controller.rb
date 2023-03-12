class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params['username'])

    if @user && @user.authenticate(params[:password])
    else
      render json: {
        errors: "Wrong Credentials!"
      }, status: :authorized
    end
  end

  def destroy
    session.delete(:user_id)
  end

end
