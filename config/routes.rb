Rails.application.routes.draw do
  get 'survivors/show'
  get 'survivors/index'
  get 'survivors/destroy'
  get 'survivors/update'
  get 'survivors/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :survivors
end
