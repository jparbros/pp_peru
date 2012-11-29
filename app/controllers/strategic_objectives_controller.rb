class StrategicObjectivesController < ApplicationController
  def index
    @strategic_objectives = StrategicObjective.where('ancestry is not null').order('created_at ASC')
  end
end
