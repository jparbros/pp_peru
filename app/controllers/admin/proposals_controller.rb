class Admin::ProposalsController < Admin::BaseController
   def index
     @proposals = Proposal.all
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
     @proposal = find_proposal(params[:id])
   end

   def show
     @proposal = find_proposal(params[:id])
   end

   def destroy
     @proposal = find_proposal(params[:id])
     @proposal.destroy
     redirect_to admin_proposals_path, notice: 'Eliminado Correctamente'
   end

   def update
     @proposal = find_proposal(params[:id])
     if @proposal.update_attributes(params[:proposal])
       redirect_to admin_proposals_path, notice: 'Actualizado Correctamente'
     else
       render :edit
     end
   end

   private 

   def find_proposal(id_proposal)
     Proposal.find(id_proposal)
   end
end
