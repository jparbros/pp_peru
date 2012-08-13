class AnnotationsController < ApplicationController
  before_filter :load_annotations

  def create
    @annotation = @annotable.annotations.new(params[:annotation])
    @annotation.author = current_subject
     if @annotation.save
       redirect_to @annotable, notice: "Comentario Creado."
     else
       render :new
     end 
  end
  


  private
  def load_annotations
    klass = [News, Entry, Paper, Proposal, Discussion].detect { |c| params["#{c.name.underscore}_id"] }
    @annotable = klass.find(params["#{klass.name.underscore}_id"])
  end
end