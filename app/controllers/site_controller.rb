class SiteController < ApplicationController
	include ApplicationHelper
  
  def index
  	@sys_conf = get_sys_config
  end
end
