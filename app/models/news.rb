# == Schema Information
#
# Table name: papers
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  author_id  :integer
#  type       :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class News < Paper


  
  #
  # Delegation
  #
  delegate :count, to: :annotations, prefix: true

  #
  # Class methods
  #

  class << self
    def published
      by_status(:published).includes(:news_actors)
    end
  end

  

end
