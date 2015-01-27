class Api::V1::SectionsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: Section.all, root: "section"
  end

  def show
    section = Section.find(params[:id])
    render json: section, root: "section"
  end
end
