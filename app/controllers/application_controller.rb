class ApplicationController < ActionController::Base
  add_flash_types :success, :error

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  rescue_from StandardError, with: :render_500

  def render_404
    render template: 'errors/not_found', status: 404
  end

  def render_500
    render template: 'errors/internal_server_error', status: 500
  end
end
