Rails.application.routes.draw do
  get 'welcome/index'

  resources :domains do
    collection do
      get 'search'
    end
    resources :records, only: [:create, :destroy]
  end
  
  root 'welcome#index'
end
