class MembersController < ApplicationController
  include ApplicationHelper
	before_action :authenticate_admin!
	layout 'dashboard'

  def index
  	@sys_conf = get_sys_config
  	@admins = Admin.where(is_active: true)
  end

  def new
  	@sys_conf = get_sys_config
  	@admin = Admin.new
  end

  def create
    redirect_to root_path
  end

  def show
  	@sys_conf = get_sys_config
  	@admin = Admin.find(params[:id])
  end

  def delete
		if Admin.where(id: params[:id]).count > 0 #admin existe
			admin = Admin.find(params[:id])
			if !admin.is_active = false
				msg = 'Membro removido'
				if current_admin.id == params[:id].to_i
					!sign_out(current_admin)
				end
			else
				msg ='Erro ao Remover Membro'
			end
		else
			msg = 'Membro inexistente no BD'
		end
  	redirect_to list_admins_path, notice: msg
  end
end
