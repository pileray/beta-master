class SessionsController < ApplicationController
  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました', status: :see_other
  end
end
