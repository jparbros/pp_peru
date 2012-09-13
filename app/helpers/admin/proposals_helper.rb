module Admin::ProposalsHelper
  def link_to_by_proposal_state(proposal)
    case proposal.status
    when 'draft', 'archived' then link_to 'Publicar', admin_proposal_publish_path(proposal), class: 'btn btn-mini', method: :post
    when 'published' then link_to 'Archivar', admin_proposal_archive_path(proposal),  class: 'btn btn-mini', method: :post
    end
  end
end
