Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/books/:id" => "books#show"
  delete "/books/:id" => "books#destory"
  resources :publishers
  resource :profile


  # Defines the root path route ("/")
  # root "articles#index"
end
