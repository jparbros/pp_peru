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
  # Callback
  #
  after_initialize :parse_content

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

  def parse_content
    @content_parsed = Nokogiri::HTML(content)
  end

  def first_paragraph
    @content_parsed.css('p').first.to_s
  end

end
