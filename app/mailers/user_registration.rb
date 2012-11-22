class UserRegistration < ActionMailer::Base
  default from: "no-responder@#{SiteConfig.site_name.dasherize}.pe"
  
  def welcome(user, password)
    @site_name = SiteConfig.site_name
    @password = password
    @user = user
    mail(to: user.email, subject: "Bienvenido a la plataforma Red Social para Partidos Politicos | #{@site_name}")
  end
end
