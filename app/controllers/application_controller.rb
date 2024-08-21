class ApplicationController < ActionController::Base
  add_flash_types :success, :error

  rescue_from ActiveRecord::RecordNotFound, with: :render404
  rescue_from ActionController::RoutingError, with: :render404

  rescue_from StandardError, with: :render500

  def render404
    render template: 'errors/not_found', status: :not_found
  end

  def render500
    render template: 'errors/internal_server_error', status: :internal_server_error
  end
end
