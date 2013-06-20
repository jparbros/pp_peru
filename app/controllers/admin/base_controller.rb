class Admin::BaseController < CmsAdmin::BaseController
  before_filter :authenticate_user!
  before_filter :only_admin_user!
  before_filter :load_admin_site
  private

  def only_admin_user!
    redirect_to root_path unless current_user.admin_access?
  end
  
  def load_admin_site
    if @site = Cms::Site.find_by_id(params[:site_id] || session[:site_id]) || Cms::Site.first
      session[:site_id] = @site.id
    else
      I18n.locale = ComfortableMexicanSofa.config.admin_locale || I18n.default_locale
      flash[:error] = I18n.t('cms.base.site_not_found')
      return redirect_to(new_cms_admin_site_path)
    end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_root_path, :alert => 'No estas Autorizado para ver esta pagina'
  end
end
