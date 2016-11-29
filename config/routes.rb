Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show, :index]

  # resources :topics do
  #  	resources :posts, except: [:index] do #, controller: 'topics/posts' # this will change the route to topics/posts/	
  #  		resources :comments, only: [:create, :destroy]
  #  	end
  # end 

  # resources :posts, only: [] do 
  resources :posts, only: [:index] do 
    # post '/up-vote' => 'votes#up_vote', as: 'up_vote'  
    # post '/down-vote' => 'votes#down_vote', as: 'down_vote'
    get '/up-vote' => 'votes#up_vote', as: 'up_vote'  
    get '/down-vote' => 'votes#down_vote', as: 'down_vote'    
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
   # the 2 below are manually written routes (same as aboves) 
   # post '/favorites' => 'favorites#create', as: 'favorites' 
   # delete '/favorites/:id' => 'favorites#destroy', as: 'favorite'
  end

  resources :topics do 
    resources :posts, except: [:index], controller: 'topics/posts' 
  end

  get 'index' => 'welcome#index'
  get 'about' => 'welcome#about'

#  root 'welcome#index'
  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
