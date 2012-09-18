# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  liker_type    :string(255)
#  liker_id      :integer
#  likeable_type :string(255)
#  likeable_id   :integer
#  created_at    :datetime
#

class Like < ActiveRecord::Base
  acts_as_like_store
end
