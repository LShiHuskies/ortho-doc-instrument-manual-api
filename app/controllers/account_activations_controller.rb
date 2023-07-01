class AccountActivationsController < ApplicationController
    def edit
        @user = User.find_by(email: params[:email])
        if @user && !@user.activated? && @user.authenticated?(:activation, params[:id])
            @user.activate
            token = get_token(payload(@user.username, @user.id))
            UserMailer.welcome_email(@user)
        else
            if !@user
                render json: { message: "The user doesn't exist! Please register first."}
            elsif @user.activated?
                UserMailer.welcome_email(@user)
            else
                UserMailer.activate_account(@user)
            end
        end
    end
end
