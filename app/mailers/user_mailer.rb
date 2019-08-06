class UserMailer < ApplicationMailer
  # before_action :user_params
  before_action :category_url, only: %i[follow_email new_image_email]
  default from: ENV['MAILER_EMAIL']

  def welcome_mail(user)
    mail(to: user.email, subject: "Welcome")
  end

  def follow_email(user, category)
    @cat = category.slug
    mail(to: user, subject: 'Follow')
  end

  def new_image_email(fol, category)
    @cat = category.slug
    mail(to: fol, subject: "New Image") if fol.present?
  end
  private

  def category_url
    @url = "localhost:3000/categories/#{@cat}"
  end

  # def user_params
  #   @user = current_user.email
  # end
end
