class DiscussionsActivities::VotesController < ApplicationController
  before_filter :find_discussion
  before_filter :authenticate_user!
  
  def create
    if @discussion.votes.where(author_id: current_user).empty?
      @discussion.votes.create(author: current_user, tendency: params[:tendency])
      message = 'Su Voto se ha guardado'
    else
      message = 'Usted ya tiene un voto registrado'
    end
    redirect_to debate_path(@discussion), notice: message
  end
  

  private 
  def find_discussion
    @discussion = Discussion.find params[:debate_id]
  end
end