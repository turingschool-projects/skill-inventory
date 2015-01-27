class Api::V1::TagsController < Api::V1::BaseController
  respond_to :json

  def index
    render json: Tag.all, root: "tag"
  end

  def create
    tag = Tag.new(tag_params)
    tag.skills << Skill.where(id: params[:tag][:skills])

    if tag.save
      render status: 201, json: tag, root: "tag"
    else
      render status: 422,
      json: { tag: { errors: tag.errors.full_messages } }
    end
  end

  def show
    tag = Tag.find(params[:id])
    render json: tag, root: "tag"
  end

  def update
    tag = Tag.find(params[:id])
    tag.skills =
    Skill.where(name: params[:skill]).first if params[:skill]

    if tag.update_attributes(tag_params)
      render status: 200, json: tag, root: "tag"
    else
      render status: 422,
      json: { tag: { errors: tag.errors.full_messages } }
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy

    render status: 200, json: tag, root: "tag"
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
