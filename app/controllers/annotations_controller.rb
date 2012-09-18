class AnnotationsController < ApplicationController
  before_filter :load_annotations

  def create
    @annotation = @annotable.annotations.new(params[:annotation])
    @annotation.author = current_user
    if @annotation.save
      redirect_to @url_to_redirect, notice: "Comentario Creado."
    else
      render :new
    end
  end
  
  def new
    @annotation = @annotable.annotations.build(:parent_id => params[:parent_id])
  end



  private
  def load_annotations
    if params[:noticia_id]
      @annotable = News.find(params[:noticia_id])
      @url_to_redirect = noticia_url(@annotable)
    elsif params[:debate_id]
      @annotable = Discussion.find(params[:debate_id])
      @url_to_redirect = debate_url(@annotable)
    elsif params[:propuesta_id]
      @annotable = Proposal.find(params[:propuesta_id])
      @url_to_redirect = propuesta_url(@annotable)
    elsif params[:entrada_id]
      @annotable = Entry.find(params[:entrada_id])
      @url_to_redirect = entrada_url(@annotable)
    end
  end

end