# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    flash.clear

    user = User.find_by_email(sign_in_params['email'])

    super && return unless user
    adjust_failed_attempts user

    super && return if user.failed_attempts < User.logins_before_captcha
    super && return if verify_recaptcha

    # Don't increase failed attempts if Recaptcha was not passed
    decrement_failed_attempts(user) if recaptcha_present?(params) &&
                                       !verify_recaptcha

    # Recaptcha was wrong
    self.resource = resource_class.new(sign_in_params)
    sign_out
    flash[:error] = 'Captcha was wrong, please try again.'
    respond_with_navigational(resource) { render :new }
  end

  def after_sign_in_path_for(user)
    user.update cached_failed_attempts: 0, failed_attempts: 0
    stored_location_for(user) || categories_path
  end

  private

  def increment_failed_attempts(user)
    user.increment :cached_failed_attempts
    user.update failed_attempts: user.cached_failed_attempts
    # raise i
  end

  def decrement_failed_attempts(user)
    user.decrement :cached_failed_attempts
    user.update failed_attempts: user.cached_failed_attempts
  end

  def recaptcha_present?(params)
    params[:recaptcha_challenge_field]
  end

  # DELETE /resource/sign_out

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
