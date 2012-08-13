module ApplicationHelper

  def active_menu?(section)
    (controller_name == section) ? 'active' : nil
  end
end
