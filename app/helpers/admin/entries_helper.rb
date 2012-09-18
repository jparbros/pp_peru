module Admin::EntriesHelper
  def link_to_by_entry_state(entry)
    case entry.status
    when 'draft', 'archived' then link_to 'Publicar', admin_entry_publish_path(entry), class: 'btn btn-mini', method: :post
    when 'published' then link_to 'Archivar', admin_entry_archive_path(entry),  class: 'btn btn-mini', method: :post
    end
  end
end
