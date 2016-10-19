Rails.application.routes.draw do
  get 'welcome/index'

  resources :domains do
    collection do
      get 'search'
      get 'get_record'
    end
    resources :records, only: [:create, :destroy]
  end
  
  root 'welcome#index'
end
