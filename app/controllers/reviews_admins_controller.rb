class ReviewsAdminsController < ApplicationController
  before_filter :find_annotation
  
  def create
    @annotation.review_by_admin if current_user.admin?
  end
  
  private
  def find_annotation
    @annotation = Annotation.find params[:annotation_id]
  end
end
