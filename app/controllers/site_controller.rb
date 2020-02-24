class SiteController < ApplicationController
	include ApplicationHelper
	before_action :authenticate_admin!
	layout 'dashboard'
	 
  def index
  	@sys_conf = get_sys_config
  end


end
