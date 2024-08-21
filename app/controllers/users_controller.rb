class UsersController < ApplicationController
  before_action :require_login, only: %i[destroy]

  def destroy
    @user = current_user
    @user.destroy!
    redirect_to root_path, success: '退会しました', status: :see_other
  end
end
