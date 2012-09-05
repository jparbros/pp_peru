module Admin::DiscussionsHelper
  def time_now 
    Date.parse(Time.now.to_s).strftime("%d/%m/%Y")
  end
  
  def link_to_by_discussion_state(discussion)
    case discussion.status
      when 'draft', 'archived' then link_to_open_discussion(discussion)
      when 'opened' then link_to_close_discussion(discussion)
      when 'opened', 'closed', 'archived', 'draft' then link_to_archive_discussion(discussion)
    end #end case
  end
  
  def link_to_open_discussion(discussion)
    link_to admin_discussion_open_discussion_index_path(discussion), class: 'btn btn-mini', method: :post do
      raw('<i class="icon-circle-arrow-up"></i>') + ' Abrir Discussion'
    end
  end
  
   def link_to_close_discussion(discussion)
     link_to admin_discussion_close_discussion_index_path(discussion), class: 'btn btn-mini', method: :post do
       raw('<i class="icon-circle-arrow-down"></i>') + ' Cerrar Discussion'
     end
   end
   
   def link_to_archive_discussion(discussion)
     link_to admin_discussion_archive_discussion_index_path(discussion), class: 'btn btn-mini', method: :post do
       raw('<i class="icon-briefcase"></i>') + ' Archivar Discussion'
     end
   end
end
