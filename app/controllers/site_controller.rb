class SiteController < ApplicationController
	include ApplicationHelper
	layout 'dashboard'
	 
  def index
  	@sys_conf = get_sys_config
  end


end
