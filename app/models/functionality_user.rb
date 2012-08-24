module FunctionalityUser
   extend ActiveSupport::Concern
   included do
     #
     # Constans
     #
     ROLES = ['participant', 'admin']
     attr_accessible :role
     
     #
     # Relations
     #
     has_many :ratings, foreign_key: :author_id
     
     #
     # Scopes
     #
     
     
     #Instance methods
     
     ROLES.each do |role|
       define_method "#{role}?" do
         self.role.eql? role
       end
     end # end each
     
     def have_rateable?(rateable)
       kind = (rateable.kind_of? News)? 'Paper' : 'NewsActor'
       self.ratings.by_rateable(kind, rateable).empty?
     end
     
     def have_rate_actor_paper?(actor, paper)
       self.ratings.by_rateable('NewsActor', actor).by_paper(paper).empty?
     end
   end
end