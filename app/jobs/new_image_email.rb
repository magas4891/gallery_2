class NewImageEmail
  @queue = :img
  def self.perform(user, category)
    UserMailer.new_image_email(user, category).deliver
  end
end
