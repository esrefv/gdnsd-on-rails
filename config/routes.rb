Rails.application.routes.draw do
  get 'welcome/index'

  resources :domains do
    collection do
      get 'search'
    end
  end
  resources :records, only: [:create, :destroy]
  root 'welcome#index'
end
