 Rails.application.routes.draw do
  resources :books
  # title of controller and commanc
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
