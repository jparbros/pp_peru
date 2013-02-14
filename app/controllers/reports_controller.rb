class ReportsController < ApplicationController
  before_filter :find_annotation
  
  def create
    @annotation.report_annotation(current_user)
  end
    
  private
  def find_annotation
    @annotation = Annotation.find params[:annotation_id]
  end
end
