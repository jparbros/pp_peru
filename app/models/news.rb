# == Schema Information
#
# Table name: papers
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  content            :text
#  author_id          :integer
#  type               :string(255)
#  status             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  political_party_id :integer
#  visibility         :string(255)
#  published_at       :datetime
#  published_end_at   :datetime
#

class News < Paper


  #
  # Class methods
  #

  class << self
    def published
      by_status(:published).includes(:news_actors, :topics)
    end
    
    def news_by_title(query)
      by_status(:published).where("title like ?", "%#{query}%")
    end
  end
end
