Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root to: 'static_pages#index'

  resources :rooms do
    resources :messages
  end
end
