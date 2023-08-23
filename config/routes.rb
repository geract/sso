Rails.application.routes.draw do
  scope 'admins' do
    use_doorkeeper
  end

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  devise_scope :user do
    authenticated :user do
      root 'users/welcome#show', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :api do
    namespace :v1 do
      resource :owner, only: :show
    end
  end

  namespace :admins do
    resources :users, only: [:index, :edit, :update]
    resources :clients
  end
end
