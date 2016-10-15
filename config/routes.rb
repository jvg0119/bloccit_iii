Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  # resources :topics do
  #  	resources :posts, except: [:index] do #, controller: 'topics/posts' # this will change the route to topics/posts/	
  #  		resources :comments, only: [:create, :destroy]
  #  	end
  # end 

  resources :posts, only: [] do 
    resources :comments 
  end

  resources :topics do 
    resources :posts 
  end

  get 'index' => 'welcome#index'
  get 'about' => 'welcome#about'

#  root 'welcome#index'
  root to: 'welcome#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
