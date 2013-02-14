class ObjectivesController < ApplicationController
  def index
    @objetivos = StrategicObjective.where(political_party_objective: true)
  end
end
