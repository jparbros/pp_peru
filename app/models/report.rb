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
