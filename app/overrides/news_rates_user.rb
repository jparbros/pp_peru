Deface::Override.new(
                      :virtual_path => 'users/_show',
                      :name => 'news_rates_user',
                      :insert_bottom => 'div.space_center', 
                      :partial => 'users/rate'
                      ) 