Rails.application.routes.draw do
   
  get 'reports/get_infected_total'
  get 'reports/get_non_infected'
  get 'reports/avg_items'
  get 'reports/infected_lost_points'
  
  get 'inventories/show'
  get 'inventories/index'
  get 'inventories/trade'
  get 'infecteds/index'
  get 'infecteds/show'
  get 'infecteds/create'
  
  get 'items/show'
  get 'items/update'
  get 'items/create'
  get 'items/destroy'
 
  get 'survivors/show'
  get 'survivors/index'
  get 'survivors/destroy'
  get 'survivors/update'
  get 'survivors/create'
  get 'survivors/location/:id/:latitude/:longitude' => 'survivors#location'
  
  resources :items
  resources :survivors
  resources :inventories

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
