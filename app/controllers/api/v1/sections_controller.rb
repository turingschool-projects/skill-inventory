class Api::V1::SectionsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: { section: Section.all }
  end

  def show
    section = Section.find(params[:id])
    render json: { section: section }
  end
end
