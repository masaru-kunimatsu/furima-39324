Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
    resources :items
  resources :purchase_record, only: [:index, :create] do
    resources :shipping_adress, only: :create
  end
end
