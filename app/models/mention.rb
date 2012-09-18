# == Schema Information
#
# Table name: mentions
#
#  id               :integer          not null, primary key
#  mentioner_type   :string(255)
#  mentioner_id     :integer
#  mentionable_type :string(255)
#  mentionable_id   :integer
#  created_at       :datetime
#

class Mention < ActiveRecord::Base
  acts_as_mention_store
end
