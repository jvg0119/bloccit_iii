Rails.application.routes.draw do

  devise_for :users

  resources :topics do
   	resources :posts, except: [:index]
  end

  get 'index' => 'welcome#index'
  get 'about' => 'welcome#about'

#  root 'welcome#index'
  root to: 'welcome#index'







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
