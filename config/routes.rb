require 'sidekiq/web'
Rails.application.routes.draw do
  get 'welcome/index'
  mount Sidekiq::Web => '/sidekiq'

  resources :domains do
    collection do
      get 'search'
      get 'get_record'
    end
    resources :records, only: [:create,:update,:destroy]
  end
  
  root 'welcome#index'
end
