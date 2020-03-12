Rails.application.routes.draw do
  get 'members/index'
  get 'members/new'
  get 'members/delete'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'

  }

  root 'site#index'
  
  authenticate :admin do
    resources :admin
  	root 'site#index'
  	
  	#rotas de admin
  	get '/novo_admin', to: 'members#new', as: 'create_new_admin'
    post '/novo_admin', to: 'members#create_new', as: 'save_new_admin'
  	get '/mostrar_admins', to: 'members#index', as: 'list_admins'
    get '/mostrar_admin/:id', to: 'members#show', as: 'show_admin'
  	delete '/delete_admin/:id', to: 'members#delete', as: 'delete_admin'
  end

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
