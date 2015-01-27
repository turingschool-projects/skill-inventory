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
    rating = Rating.new(user_id: params[:user], skill_id: params[:skill], score: params[:score])

    if rating.save
      render status: 201, json: rating, root: "rating"
    else
      render status 422, json: { rating: { errors: rating.errors.full_messages } }
    end
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
    params.require(:rating).permit(:skill, :score)
  end

end
