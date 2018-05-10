class UserMailer < ApplicationMailer
  default from: "99 Cats <cat@99cats.com>"

  def welcome_email(user)
    @user = user
    @url  = 'http://99cats.com/session/new'
    mail(to: user.username, subject: 'Welcome to 99 Cats')
  end
end
