class StrategicObjectivesController < ApplicationController
  def index
    @strategic_objectives = StrategicObjective.where('ancestry is not null').order(:date_objective)
  end
end
