class ObjectivesController < ApplicationController
  def index
    @objetivos = StrategicObjective.where(political_party_objective: true)
    render cms_layout: 'diseno-principal'
  end
end
