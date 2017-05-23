Rails.application.routes.draw do
  root to: 'catastrophes#login'

  require 'sidekiq/web'
  mount Sidekiq::Web, at: 'sidekiq'
  mount PgHero::Engine, at: 'pghero'

  resources :catastrophes, only: [:index, :show] do
    collection do
      get 'login'
      post 'loginPost', to: 'loginPost'
    end
  end

  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    post 'report', to: 'catastrophes#drone_report_rama'

    resources :catastrophes, only: [:show] do
      collection do
        get 'simulation', to: 'catastrophes#simulation'
      end
      member do
        post 'drone_report', to: 'catastrophes#drone_report'
        delete 'drone_report/:report_id', to: 'catastrophes#delete_drone_report'
      end
    end
  end
end
