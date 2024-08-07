class Mypage::LineNotificationsController < Mypage::BaseController
  before_action :set_user

  def edit; end

  def update
    @user.update!(line_notification_params)
    flash.now[:success] = if @user.line_notification
                            '通知設定をオンにしました'
                          else
                            '通知設定をオフにしました'
                          end
  end

  private

  def set_user
    @user = current_user
  end

  def line_notification_params
    params.require(:user).permit(:line_notification)
  end
end
