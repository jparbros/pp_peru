module UsersHelper
  def item_by_class(class_n)
    case class_n
    when 'Discussion' then 'el debate'
    when 'News' then 'la noticia'
    when 'Entry' then 'la entrada'  
    end
  end
  
  def link_for_user_follow
    return if @user == current_user or current_user.nil?
    if current_user.follows?(@user)
      link_to 'Dejar de Seguir', usuario_seguidore_path(@user), method: :delete, class: 'btn btn-danger'
    else
      link_to 'Seguir', usuario_seguidores_path(@user), method: :post, class: 'btn btn-primary'
    end    		
  end
end
