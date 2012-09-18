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

class Discussion < Paper
  
  #
  # State machine
  #
  state_machine :status, :initial => :draft do
    state :draft
    state :opened
    state :closed 
    state :archived

    before_transition any => :opened, :do => [:publish_timestamp, :setup_activity]

    event :open_discussion do
      transition [:draft, :archived] => :opened
    end
    
    event :close_discussion do 
      transition :opened => :closed
    end

    event :archive do
      transition [:opened, :closed, :archived, :draft]  => :archived
    end
  end
  
  
  #
  #
  # Class methods
  #
  
  def self.actives
    by_status([:opened, :closed]).includes(:topics)
  end
end

