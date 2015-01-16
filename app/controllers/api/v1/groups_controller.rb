class Api::V1::GroupsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: { group: Group.all }
  end
end
