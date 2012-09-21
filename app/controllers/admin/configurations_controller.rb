class Admin::ConfigurationsController < Admin::BaseController
  def show
  end
  
  def edit
    @configuration = Configurable.first
  end
  
  def update
    @configuration = Configurable.first
    if @configuration.update_attributes(params[:configurable])
      SiteConfig.reload
      redirect_to admin_configuration_url
    else
      render :edit
    end
  end
end
