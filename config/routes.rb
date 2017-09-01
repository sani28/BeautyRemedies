Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  resources :product_reviews, only: [:new, :create, :show]
  resources :products
  resources :articles

  resources :users, only: [:new, :create, :show, :update, :edit]
  resource :session, only: [:new, :create, :destroy]

  get '/api/categories/:id/sub_categories' => "categories#sub_categories_listing"

end
