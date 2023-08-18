Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
    resources :items do
      resources :purchase_record, only: [:index, :create, :new] 
      resources :shipping_adress, only: :create
  end
end
