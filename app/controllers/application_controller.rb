class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class Forbidden < ActionController::ActionControllerError
  end

  rescue_from Forbidden, with: :rescue403

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def rescue403(e)
    @exception = e
    render template: 'errors/forbidden', status: 403
  end
end
