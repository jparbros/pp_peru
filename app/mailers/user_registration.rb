class UserRegistration < ActionMailer::Base
  default from: "no-responder@#{Setting.site_name.try(:dasherize)}.pe"
  
  def welcome(user, password)
    @site_name = Setting.site_name || ""
    @password = password
    @user = user
    mail(to: user.email, subject: "Bienvenido a la plataforma Red Social para Partidos Politicos | #{@site_name}")
  end
end
