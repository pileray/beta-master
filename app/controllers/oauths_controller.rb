class OauthsController < ApplicationController
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, :success => "ログインしました!"
    else
      begin
        @user = create_from(provider)

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to complete_signup_path, :success => "LINE連携が完了しました!"
      rescue
        redirect_to root_path, :error => "LINE連携に失敗しました"
      end
    end
  end
end
