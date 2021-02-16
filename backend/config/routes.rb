Rails.application.routes.draw do
  resources :vehicles do
    collection do
       get 'search'
    end
  end
  resources :vehiclemodels
  resources :vehiclebrands
end
