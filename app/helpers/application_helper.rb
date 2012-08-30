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
end
