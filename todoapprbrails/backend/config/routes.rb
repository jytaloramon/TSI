Rails.application.routes.draw do

  resources :task, only: [:index, :create, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
