# == Schema Information
#
# Table name: reports
#
#  id              :integer          not null, primary key
#  author_id       :integer
#  reportable_id   :integer
#  reportable_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Report < ActiveRecord::Base
   #
   # Associations
   #
   belongs_to :reportable, polymorphic: true
   belongs_to :author, class_name: 'User', foreign_key: :author_id
   
   #
   #   Scopes
   #
   scope :by_author, lambda{|author| where(author_id: author)}
end
