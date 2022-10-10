Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/books/:id" => "books#show"
  delete "/books/:id" => "books#destory"
  resources :publishers

  # Defines the root path route ("/")
  # root "articles#index"
end
