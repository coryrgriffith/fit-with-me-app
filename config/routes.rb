Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/exercises' => 'exercises#index'
    get '/exercises/:id' => 'exercises#show'

    get '/users/' => 'users#index'
    get '/users/:id' => 'users#show'
    post '/users' => 'users#create'
    patch '/users/:id' => 'users#update'
    # destroy

    post '/sessions' => 'sessions#create'
  end
end
