class ProposalsController < ApplicationController
  before_filter :find_proposal, :only => [:show, :edit, :update]
  before_filter :authenticate_user!, :only => [:new, :create]
  
  def index
    @proposals = Proposal.text_search(params[:query]).published.by_permissions(current_user).by_topics(params[:topic_id])
  end
  
  def show
    authorize! :read, @proposal
  end
  
  def create
     @proposal = Proposal.new(params[:proposal])
     @proposal.author = current_user
     if @proposal.save
       @proposal.publish!
       redirect_to propuestas_path, notice: 'Su propuesta se a Creado Correctamente, Espere hasta que sea autorizada'
     else
       render :new
     end
   end
  
  def new
    @proposal = Proposal.new
  end
  
  def find_proposal
    @proposal = Proposal.find params[:id]
  end
end
