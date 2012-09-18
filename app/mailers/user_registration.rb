class UserRegistration < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome(user, password)
    mail(to: user.email, subject: 'Bienvenido a la plataforma de partidos politicos PE', body: "Contraseña: #{password}")
  end
end
