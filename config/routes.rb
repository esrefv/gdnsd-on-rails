Rails.application.routes.draw do
  get 'welcome/index'

  resources :domains do
    collection do
      get 'search'
    end
  end
  root 'welcome#index'
end
