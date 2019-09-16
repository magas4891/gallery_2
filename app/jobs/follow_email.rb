class FollowMail
  @queue = :follow
  def self.perform(user, category)
    UserMailer.follow_email(user, category).deliver
    puts "======================================================================================="
    puts "Job done, message to #{user.email} has being send"
    puts "======================================================================================="
  end
end
