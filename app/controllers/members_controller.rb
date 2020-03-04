class MembersController < ApplicationController
  include ApplicationHelper
	before_action :authenticate_admin!
	layout 'dashboard'

  def index
  	@sys_conf = get_sys_config
  	@admins = Admin.all
  end

  def new
  	@sys_conf = get_sys_config
  	@admin = @admin.new
  end

  def delete
  	@sys_conf = get_sys_config
  end
end
