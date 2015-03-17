class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_filter :verify_authenticity_token

  def create
    if user
      session[:user_id] = user.id
      render json: user.as_json(only: [:id, :token, :email, :name, :username,
                                       :provider, :thumbnail_url, :uid]
                               ), status: :created
    else
      render nothing: true, status: :bad_request
    end
  end

  private

  def user
    @_user ||= fetch_or_create_user
  end

  def fetch_or_create_user
    if github_auth_code
      find_or_create_user_from_github
    elsif token
      User.find_by(token: token)
    end
  end

  def find_or_create_user_from_github
    github_authenticator = GithubAuthenticator.new(github_auth_code)
    UserFactory.new(github_authenticator).find_or_create_user
  end

  def token
    @_token ||= session_params[:token]
  end

  def github_auth_code
    @_github_auth_code ||= session_params[:'github-auth-code']
  end

  def session_params
    params.permit(:'github-auth-code', :token)
  end
end
