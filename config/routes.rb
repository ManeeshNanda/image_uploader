Rails.application.routes.draw do
  get 'mainpage/index'

  resources :albums
  resources :images
  devise_for :users
  resources :users
	# resources :homepages do
	# 	get 'homepage/index' , :to => 'homepage#index'
 #  	# get 'homepages#index'
	# end
	resources :mainpage

  # resources :homepages do 
  # 	get 'index'
  # end
  root :to => "mainpage#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
