Rails.application.routes.draw do
   
  get 'infecteds/index'
  get 'infecteds/show'
  get 'infecteds/create'
  
  resources :items
  get 'items/show'
  get 'items/update'
  get 'items/create'
  get 'items/destroy'
 
  resources :survivors
  get 'survivors/show'
  get 'survivors/index'
  get 'survivors/destroy'
  get 'survivors/update'
  get 'survivors/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
