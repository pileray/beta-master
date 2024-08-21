module LoginMacros
  def login_user_system_spec(user)
    page.set_rack_session(user_id: user.id)
  end

  def login_user_request_spec(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
end
