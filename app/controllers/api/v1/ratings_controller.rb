class Api::V1::RatingsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: Rating.all, root: "rating"
  end

  def show
    rating = Rating.find(params[:id])
    render json: rating, root: "rating"
  end

  def create
    users_rated_skills = current_user.ratings.map { |r| r.skill }
    skill = Skill.where(id: params["rating"]["skill"]).first
    if users_rated_skills.include?(skill)
      return revise(skill)
    end
    rating = Rating.new(rating_params)
    rating.user = User.where(id: session[:user_id]).first
    rating.skill = Skill.where(id: params["rating"]["skill"]).first

    if rating.save
      render status: 201, json: rating, root: "rating"
    else
      render status 422, json: { rating: { errors: rating.errors.full_messages } }
    end
  end

  def revise(skill)
    rating = current_user.ratings.where(:skill => skill).first
    rating.score = params["rating"]["score"]
    render status: 200, json: rating, root: "rating" 
  end

  def update
    rating = Rating.find(params[:id])
    if rating.update_attributes(rating_params)
      render status: 200, json: { rating: rating }
    else
      render status 422, json: { rating: { errors: rating.errors.full_messages } }
    end
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.destroy

    render status 200, json: { rating: rating }
  end

  private

  def rating_params
    params.require(:rating).permit(:score)
  end

end
