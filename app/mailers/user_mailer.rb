# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: ENV['MAILER_EMAIL']

  def welcome_mail(user)
    @user = user
    mail(to: @user['email'], subject: 'Welcome')
  end

  def follow_email(user, category)
    @cat = category['slug']
    @url = "http://localhost:3000/categories/#{@cat}"
    @user = user
    mail(to: @user['email'], subject: 'Follow')
  end

  def new_image_email(fol, category)
    @cat = category['slug']
    @url = "http://localhost:3000/categories/#{@cat}"
    @fol = fol
    mail(to: fol, subject: 'New Image') if fol.present?
  end
end
