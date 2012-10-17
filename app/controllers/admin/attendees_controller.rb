class Admin::AttendeesController < Admin::BaseController
  before_filter :find_attendee, only: [:edit, :update, :destroy, :show]
  
  def index
    @attendees = Attendee.scoped
    respond_to do |format|
      format.html
      format.json {render json:  @attendees.where("name like ?", "%#{params[:q]}%")}
    end
  end
  
  def new
    @attendee = Attendee.new
  end
  
  def edit
  end
  
  def update
    if @attendee.update_attributes(params[:attendee])
      redirect_to admin_attendees_path, notice: 'Actualizado Correctamente'
    else
      render :edit
    end
  end
  
  def show
  end
  
  
  def create
    @attendee = Attendee.new(params[:attendee])
    if @attendee.save
      redirect_to find_response_by_referer
    else
      render :new
    end
  end
  
  def destroy
    @attendee.destroy
    redirect_to admin_attendees_path, notice: 'Asistente Eliminado'
  end
  
  private
  def find_attendee
    @attendee = Attendee.find params[:id]
  end
  
  def find_response_by_referer
    (URI(request.referer).path.eql? '/admin/attendees/new') ? admin_attendees_path : admin_strategic_objectives_path
  end
end
