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

  def create_new
    admin = Admin.new(name: params[:admin][:name], 
                      password: params[:admin][:password],
                      cel: params[:admin][:cel], 
                      email: params[:admin][:email])
    admin.is_active = true
    if(admin.save!)
      msg = 'Membro adicionado'
      redirect_to list_admins_path, notice: msg
    else
      msg = 'Falha ao adicionar membro'
      redirect_to root_path, notice: msg
    end

    
  end

  def show
  	@sys_conf = get_sys_config
  	@admin = Admin.find(params[:id])
  end

  def delete
		if Admin.where(id: params[:id]).count > 0 #admin existe
			admin = Admin.find(params[:id])
			if admin.is_active == true
        admin.is_active = false
				if admin.save!
          msg = 'Membro removido'
  				if current_admin.id == params[:id].to_i
  					!sign_out(current_admin)
  				end
        else
          msg ='Erro ao Remover Membro'  
        end
			else
				msg ='Membro já foi removido'
			end
		else
			msg = 'Membro inexistente no BD'
		end
  	redirect_to list_admins_path, notice: msg
  end
end
