class Admin::AnnotationsController < Admin::BaseController
  before_filter :load_annotation
  respond_to :html, :js
  
  def new
    @annotation = @annotable.annotations.build(parent_id: params[:parent_id])
  end
  
  def create
    @annotation = @annotable.annotations.new(params[:annotation])
    @annotation.author = current_user
    @annotation.save
    respond_with @annotable, location: :admin_strategic_objectives
  end
  
  private
  def load_annotation
    @annotable = StrategicObjective.find params[:strategic_objective_id]
  end
end
