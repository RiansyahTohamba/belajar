Rails.application.routes.draw do
  resources :products
  get 'say/good'

  get 'say/awesome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
