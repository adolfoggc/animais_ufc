Rails.application.routes.draw do
  get 'members/index'
  get 'members/new'
  get 'members/delete'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  root 'site#index'
  
  authenticate :admin do
  	root 'site#index'
  	
  	#rotas de admin
  	get '/novo_admin', to: 'members#new', as: 'new_admin'
  	get '/list_admins', to: 'members#index', as: 'list_admins'
  	delete '/delete_admin', to: 'members#delete', as: 'delete_admin'
  end

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
