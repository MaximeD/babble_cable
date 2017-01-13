Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root to: 'static_pages#index'

  resources :rooms, only: :create do
    resources :messages, only: :index
  end
end
