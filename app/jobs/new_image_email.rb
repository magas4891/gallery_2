class NewImageEmail
  @queue = :img
  def self.perform(user, category)
    UserMailer.new_image_email(user, category).deliver
    puts '====================================================================='
    puts "Job done, message to #{user} has being send"
    puts '====================================================================='
  end
end
