class UserMailer < ApplicationMailer
    default :from => 'codecove2@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Orthodoc Instrument Manual!')
  end
    # def send_verification_email(user)
    #     @user = user
    #     mail(to: user.email, subject: 'Email Verification')
    # end
end
