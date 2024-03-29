Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get 'numbers/single/:number', to: 'numbers#single'
      post 'numbers/batch', to: 'numbers#batch'
    end
  end
end
