class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class Forbidden < ActionController::ActionControllerError
  end

    rescue_from Forbidden, with: :rescue403
    rescue_from Exception, with: :rescue500

  def rescue404
    render 'errors/not_found', status: 404
  end

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def rescue403
    render template: 'errors/forbidden', status: 403
  end

  def rescue500
    render template: 'errors/internal_server_error', status: 500
  end
end
