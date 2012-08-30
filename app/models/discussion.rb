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

class Discussion < Paper
  
  #
  # Delegations
  #
  delegate :count, to: :annotations, prefix: true
  #
  # State machine
  #
  state_machine :status, :initial => :draft do
    state :draft
    state :opened
    state :closed 
    state :archived

    before_transition any => :opened, :do => :publish_timestamp

    event :open_discussion do
      transition [:draft, :archived, :closed] => :opened
    end
    
    event :close_discussion do 
      transition :opened => :closed
    end

    event :archive do
      transition [:opened, :closed, :archived, :draft]  => :archived
    end
  end
  
  #
  # Class methods
  #
  
  def self.actives
    by_status [:opened, :closed]
  end
end

