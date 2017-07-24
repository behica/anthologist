Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end
  
  resources :stories do
    resources :collections, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    
    post '/like' => 'ratings#like', as: :likes
  end
  
  get 'collection' => 'collections#index'
  
  root 'welcome#index'
end
