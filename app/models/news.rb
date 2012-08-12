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
  state_machine :status, :initial => :draft do
    state :draft
    state :published
    
    event :publish do
      transition :draft => :published
    end
  end # end state machine
end
