class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_activity(action)
    Activity.create!(user_id: current_user.id, action: action, url: request.original_url)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name nick])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name nick])
  end
end
