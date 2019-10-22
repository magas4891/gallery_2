class WelcomeMail
  @queue = :welcome
  def self.perform(user)
    UserMailer.welcome_mail(user).deliver
    puts '====================================================================='
    puts "Job done, message to #{user.email} has being send"
    puts '====================================================================='
  end
end
