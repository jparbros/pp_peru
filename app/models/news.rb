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
  # State machine
  #
  state_machine :status, :initial => :draft do
    state :draft
    state :published
    state :archived

    event :publish do
      transition :draft => :published
    end

    event :archived do
      transition published: :archived
    end
  end

  #
  # Callback
  #
  after_initialize :parse_content

  #
  # Delegation
  #
  delegate :count, to: :annotations, prefix: true

  def parse_content
    @content_parsed = Nokogiri::HTML(content)
  end

  def first_paragraph
    @content_parsed.css('p').first.to_s
  end

end
