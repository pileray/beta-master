class SessionsController < ApplicationController
  before_action :require_login, only: %i[destroy]

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました', status: :see_other
  end
end
