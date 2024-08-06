class Mypage::AccountsController < Mypage::BaseController
  def edit
    @user = current_user
  end
end
