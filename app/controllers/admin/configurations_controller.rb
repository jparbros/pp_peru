class Admin::ConfigurationsController < Admin::BaseController

  def show
    authorize! :config_site, :show
  end
  
  def edit
    authorize! :config_site, :edit
    @configuration = Configurable.first
  end
  
  def update
    authorize! :config_site, :update
    @configuration = Configurable.first
    if @configuration.update_attributes!(params[:configurable])
      SiteConfig.reload
      redirect_to admin_configuration_url
    else
      render :edit
    end
  end
end
