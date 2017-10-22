Rails.application.routes.draw do
  root 'web_pages#index'
  resources :web_pages
end
