module FunctionalityUser
   extend ActiveSupport::Concern
   included do
     attr_accessible :role
   end
end