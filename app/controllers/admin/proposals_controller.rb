class Admin::ProposalsController < Admin::BaseController
  before_filter :find_proposal, only: [:edit, :show, :detroy, :update]
  before_filter :ensure_author!, only: [:edit, :show, :detroy, :update]
   def index
     @proposals = Proposal.by_author(current_user)
   end

   def new
     @proposal = Proposal.new
   end

   def create
     @proposal = Proposal.new(params[:proposal])
     @proposal.author = current_user
     if @proposal.save
       redirect_to admin_proposals_path, notice: 'Creado Correctamente'
     else
       render :new
     end
   end

   def edit
   end

   def show
   end

   def destroy
     @proposal.destroy
     redirect_to admin_proposals_path, notice: 'Eliminado Correctamente'
   end

   def update
     if @proposal.update_attributes(params[:proposal])
       redirect_to admin_proposals_path, notice: 'Actualizado Correctamente'
     else
       render :edit
     end
   end

   private 

   def find_proposal
     @proposal = Proposal.find(params[:id])
   end
   
   def ensure_author!
     redirect_to admin_proposals_path, notice: 'Recurso no Autorizado' if @proposal.author_id != current_user.id
   end
end
