class ApplicationController < ActionController::Base
  def user_activity(action)
    Activity.create(user_id: current_user.id, action: action, url: request.original_url)
  end
end
