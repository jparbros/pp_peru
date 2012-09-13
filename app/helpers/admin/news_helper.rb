module Admin::NewsHelper
  def link_to_by_news_state(news)
    case news.status
    when 'draft', 'archived' then link_to 'Publicar', admin_news_publish_path(news), class: 'btn btn-mini', method: :post
    when 'published' then link_to 'Archivar', admin_news_archive_path(news),  class: 'btn btn-mini', method: :post
    end
  end
end
