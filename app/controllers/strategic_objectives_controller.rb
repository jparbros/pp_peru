class StrategicObjectivesController < ApplicationController
  def index
    @strategic_objectives = StrategicObjective.where('ancestry is not null').order('created_at ASC')
    render cms_layout: 'diseno-principal'
  end
end
