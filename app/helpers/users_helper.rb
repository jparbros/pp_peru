module UsersHelper
  def item_by_class(class_n)
    case class_n
    when 'Discussion' then 'el debate'
    when 'News' then 'la noticia'
    when 'Entry' then 'la entrada'  
    end
  end
end
