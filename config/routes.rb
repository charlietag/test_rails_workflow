Rails.application.routes.draw do
  resources :books do
    patch 'state_change', on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
