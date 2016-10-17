class AppMailer < ActionMailer::Base
  def send_welcome_email(user)
    @user = user
    mail to: @user.email, from: "info@myflix.com", subject: "Welcome to MyFlix!"
  end

  def send_forgot_password(user)
    @user = user
    mail to: @user.email, from: "info@myflix.com", subject: "Please reset your password"
  end

  def send_invitation_email(invitation)
    @invitation = invitation
    mail to: @invitation.recipient_email, from: "info@myflix.com", subject: "You've been invited to join MyFlix"
  end
end