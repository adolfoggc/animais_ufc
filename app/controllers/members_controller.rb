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

  def show
  	@sys_conf = get_sys_config
  	@admin = Admin.find(params[:id])
  end

  def delete
  	if(current_admin.id != params[:id].to_i)
  		if Admin.where(id: params[:id]).count > 0
  			admin = Admin.find(params[:id])
  			if !admin.delete
  				msg = 'Membro removido'
  			else
  				msg ='Erro ao Remover Membro'
  			end
  		else
  			msg = 'Membro inexistente no BD'
  		end
  	else
  		msg = 'Você não pode se remover'	
  	end
  	redirect_to list_admins_path, notice: msg
  end
end
