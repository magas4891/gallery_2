class ApplicationController < ActionController::Base
  before_action :set_locale

  def user_activity(action)
    Activity.create(user_id: current_user.id, action: action, url: request.original_url)
  end

  # def set_locale
  #   locale = params[:locale].to_s.strip.to_sym
  #   I18n.locale = I18n.available_locales.include?(locale) ?
  #                     locale :
  #                     I18n.default_locale
  # end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

end
