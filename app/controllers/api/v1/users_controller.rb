class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json

  def index
    render json: { user: User.where }
  end

end
