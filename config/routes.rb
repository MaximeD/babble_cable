Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root to: 'static_pages#index'

  resources :rooms, only: :create do

    member do
      get :tokenize_session
    end

    resources :messages, only: :index
  end
  resources :uploads
end
