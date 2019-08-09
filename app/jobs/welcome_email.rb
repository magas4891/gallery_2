class WelcomeMail
  @queue = :welcome
  def self.perform(user)
    UserMailer.welcome_mail(user).deliver
  end
end
