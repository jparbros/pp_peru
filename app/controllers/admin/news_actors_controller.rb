class Admin::NewsActorsController < Admin::BaseController
  def index
    @actors = NewsActor.order(:name)
    respond_to do |format|
      format.html
      format.json { render json: @actors.where("name like ?", "%#{params[:q]}%") }
    end
  end
end
