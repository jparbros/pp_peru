class Admin::ProposalsActions::ArchiveController < Admin::BaseController

  def create
    @proposal = Proposal.find params[:proposal_id]
    @proposal.archive! if @proposal.can_archive?
    redirect_to admin_proposals_path, notice: 'La propuesta se ha archivado.'
  end

end
