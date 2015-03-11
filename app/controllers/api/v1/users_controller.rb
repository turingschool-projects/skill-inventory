class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json

  def update
    user = User.find(params[:id])

    if user.update_attributes(user_params)
      render status: 200, json: user, root: "user"
    else
      render status: 422,
             json: { user: { errors: user.errors.full_messages } }
    end
  end

  private

  def user_params
    params.require(:user).permit(:cohort_id)
  end
end
