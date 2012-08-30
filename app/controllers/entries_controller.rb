class EntriesController < ApplicationController
  
  def index
    @entries = Entry.order(:published_at) # Todo agregar relgas de publicacion y visibilidad
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
