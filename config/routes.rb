Rails.application.routes.draw do
  root to: 'application#index'

  require 'sidekiq/web'
  mount Sidekiq::Web, at: 'sidekiq'
  mount PgHero::Engine, at: 'pghero'

  resources :catastrophes, only: [:show]

  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :catastrophes, only: [:show] do
      member do
        post 'drone_report', to: 'catastrophes#drone_report'
      end
    end
  end
end
