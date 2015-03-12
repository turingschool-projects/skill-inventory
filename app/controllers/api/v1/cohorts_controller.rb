class Api::V1::CohortsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: Cohort.all
  end

  def show
    cohort = Cohort.find(params[:id])
    render json: cohort
  end

  def create
    cohort = Cohort.new(cohort_params)

    if cohort.save
      render status: 201, json: cohort
    else
      render status: 422, json: {
        cohort: { errors: cohort.errors.full_messages }
      }
    end
  end

  def update
    cohort = Cohort.find(params[:id])
    if cohort.update_attributes(cohort_params)
      render status: 200, json: { cohort: cohort }
    else
      render status: 422, json: {
        cohort: { errors: cohort.errors.full_messages }
      }
    end
  end

  def destroy
    cohort = Cohort.find(params[:id])
    cohort.destroy
    render status 200, json: { cohort: cohort }
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name)
  end

end
