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

    get '/fit_groups' => 'fit_groups#index'
    get '/fit_groups/:id' => 'fit_groups#show'
    post '/fit_groups' => 'fit_groups#create'
    patch '/fit_groups/:id' => 'fit_groups#update'
    delete '/fit_groups/:id' => 'fit_groups#destroy'

    get '/workouts' => 'workouts#index'
    get '/workouts/:id' => 'workouts#show'
    post '/workouts' => 'workouts#create'
    patch '/workouts/:id' => 'workouts#update'
    delete '/workouts/:id' => 'workouts#destroy'

    # both of the first routes go to create in order to allow my app to redirect to the create action
    get '/exercise_workouts' => 'exercise_workouts#create'
    post '/exercise_workouts' => 'exercise_workouts#create'
    # get '/exercise_workouts/:id' => 'exercise_workouts#show'
    delete '/exercise_workouts/:id' => 'exercise_workouts#destroy'

    get '/carted_exercises' => 'carted_exercises#index'
    get '/carted_exercises/:id' => 'carted_exercises#show'
    post '/carted_exercises' => 'carted_exercises#create'
    delete '/carted_exercises/:id' => 'carted_exercises#destroy'

    # both of the first routes go to create in order to allow my app to redirect to the create action
    get '/captains' => 'captains#create'
    get '/captains/all' => 'captains#index'
    post '/captains' => 'captains#create'
    get '/captains/:id' => 'captains#show'

    # both of the first routes go to create in order to allow my app to redirect to the create action
    get '/user_fit_groups' => 'user_fit_groups#create'
    post '/user_fit_groups' => 'user_fit_groups#create'

    # both of the first routes go to create in order to allow my app to redirect to the create action
    get '/shared_workouts' => 'shared_workouts#create'
    post '/shared_workouts' => 'shared_workouts#create'

  end
end
