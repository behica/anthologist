Rails.application.routes.draw do
  resources :stories

  root 'welcome#index'
end
