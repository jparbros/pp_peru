class ProposalsActivities::VotesController < ApplicationController
  before_filter :find_proposal
  before_filter :authenticate_user!
  
  def create
    if @proposal.votes.where(author_id: current_user).empty?
      @proposal.votes.create(author: current_user, tendency: params[:tendency])
      message = 'Su Voto se ha guardado'
    else
      message = 'Usted ya tiene un voto registrado'
    end
    redirect_to propuesta_path(@proposal), notice: message
  end
  

  private 
  def find_proposal
    @proposal = Proposal.find params[:propuesta_id]
  end
end