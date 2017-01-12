Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root to: 'rooms#index'

  resources :rooms do
    resources :messages
  end
end
