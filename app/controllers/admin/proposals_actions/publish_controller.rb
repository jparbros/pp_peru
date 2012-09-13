class Admin::ProposalsActions::PublishController < Admin::BaseController

  def create
    @proposal = Proposal.find params[:proposal_id]
    @proposal.publish! if @proposal.can_publish?
    redirect_to admin_proposals_path, notice: 'La Propuesta se ha publicado.'
  end

end
