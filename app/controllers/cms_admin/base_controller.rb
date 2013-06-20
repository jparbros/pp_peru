require_dependency ComfortableMexicanSofa::Engine.root.join('app', 'controllers', 'cms_admin', 'base_controller').to_s

class CmsAdmin::BaseController < ApplicationController
  layout 'admin'
end