class FollowMail
  @queue = :follow
  def self.perform(user, category)
    UserMailer.follow_email(user, category).deliver
  end
end
