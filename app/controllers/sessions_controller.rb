class SessionsController < ApplicationController

  def create
    user = User.create_from_oauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to 'http://localhost:4200/'
  end

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end
end
