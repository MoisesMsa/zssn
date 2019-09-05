Rails.application.routes.draw do
  get 'suvivors/show'
  get 'suvivors/index'
  get 'suvivors/destroy'
  get 'suvivors/update'
  get 'suvivors/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :suvivors
end
