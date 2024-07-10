class OauthsController < ApplicationController
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, :success => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, :success => "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, :error => "Failed to login from #{provider.titleize}!"
      end
    end
  end
end
