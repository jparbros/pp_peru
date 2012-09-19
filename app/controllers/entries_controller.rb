class EntriesController < ApplicationController
  
  def index
    @entries = Entry.text_search(params[:query]).published.by_permissions(current_user).by_topics(params[:topic_id])
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
