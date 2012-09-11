# == Schema Information
#
# Table name: annotations
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  comment        :text
#  annotable_id   :integer
#  annotable_type :string(255)
#  author_id      :integer
#  status         :string(255)
#  ancestry       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Annotation < ActiveRecord::Base
  before_create :setup_activity
  #
  # Accessors
  #
  attr_accessible :ancestry, :annotable_id, :annotable_type, :author_id, 
    :comment, :reports, :status, :title, :parent_id

  #
  # Associations
  #
  belongs_to :annotable, :polymorphic => true
  belongs_to :author, class_name: 'User'
  has_many :reports, as: :reportable

  #
  # Delegates
  #
  delegate :email, :to => :author, :prefix => true


  #
  # Extends
  #
  has_ancestry
  include PublicActivity::Model
  tracked
  acts_as_likeable
  
  #
  # State machine
  #
  state_machine :status, :initial => :new_annotation do
    state :new_annotation
    state :first_report
    state :second_report
    state :third_report
    state :revised_by_admin
    state :reported_by_admin

    event :report do
      transition :new_annotation => :first_report, :first_report => :second_report, :second_report => :third_report
    end
    
    event :review_by_admin do
      transition [:first_report, :second_report, :third_report] => :revised_by_admin
    end
    
    event :report_by_admin do
      transition [:new_annotation, :first_report, :second_report, :third_report] => :reported_by_admin
    end
  end
  
  #
  #Instance method
  #
  
  def report_annotation(user)
    user.admin? ? report_by_admin : report_by_user(user)
    self
  end
  
  def have_some_report?
    first_report? or second_report? or third_report?
  end
  
  
  #
  #Private
  #
  private
  
  def setup_activity
    self.activity_owner = :author
    self.activity_params = {title: self.annotable.title, class: self.annotable.class.name, id: self.annotable.id}
  end
  
  def reported_by_this_author?(author) 
    reports.by_author(author).empty?
  end
  
  def report_by_user(user)
    if reported_by_this_author?(user)
      report
      reports.create(author: user)
    end
  end
end
