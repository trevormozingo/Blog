Rails.application.routes.draw do

	resources :comments, :except => [:new, :index, :show]
	resources :posts, :except => [:new, :index, :show]
	resources :users, :except => [:new, :index, :show]

	post   'login'   => 'sessions#create'
	delete 'logout'  => 'sessions#destroy'

	get 'show' => 'welcome#show'

	get 'welcome/home'
	get 'welcome/index'

	root 'welcome#index'

end
