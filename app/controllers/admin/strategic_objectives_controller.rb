class Admin::StrategicObjectivesController < Admin::BaseController
  before_filter :find_strategic_objective, only: [:edit, :update, :destroy, :show]
  respond_to :html, :js, :json
  
  def new
    @strategic_objective = StrategicObjective.new parent_id: params[:parent_id]
  end

  def index
    @strategic_objectives = StrategicObjective.scoped
  end
  
  def create
    @strategic_objective = StrategicObjective.new params[:strategic_objective]
    @strategic_objective.save
    respond_with @strategic_objective, location: :admin_strategic_objectives
  end
  
  def update
    @strategic_objective.update_attributes params[:strategic_objective]
    respond_with @strategic_objective
  end
  
  def destroy
    @strategic_objective.destroy
    respond_with @strategic_objective, location: :admin_strategic_objectives
  end
  
  private
  def find_strategic_objective
    @strategic_objective = StrategicObjective.find params[:id]
  end
end