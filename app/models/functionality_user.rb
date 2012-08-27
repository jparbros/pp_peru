module FunctionalityUser
   extend ActiveSupport::Concern
   included do
     #
     # Constans
     #
     ROLES = ['participant', 'admin', 's_admin']
     attr_accessible :role, :political_party, :political_party_id
     
     #
     # Relations
     #
     has_many :ratings, foreign_key: :author_id
     belongs_to :political_party
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
     
     def user_rates
       self.ratings.includes(:rateable).group_by(&:rateable_type)
     end
   end
end