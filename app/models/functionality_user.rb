module FunctionalityUser
   extend ActiveSupport::Concern
   included do
     ROLES = ['participant', 'admin']
     attr_accessible :role
     
     ROLES.each do |role|
       define_method "#{role}?" do
         self.role.eql? role
       end
     end
   
   end
end