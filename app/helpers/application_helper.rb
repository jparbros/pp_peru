module ApplicationHelper

  def active_menu?(section)
    (controller_name == section) ? 'active' : nil
  end
  
  def selected_menu(menu_element)
    content_for(menu_element, 'current')
  end
  
  def section_title(title)
    content_for(:section_title, title)
  end
  
  def link_for_user_login_or_logout
    if current_user
      link_to 'Sair', destroy_user_session_path, :method => :delete 
    else
      link_to 'Inicar Sesion', new_user_session_path
    end
  end
end
