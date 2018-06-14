Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :client do 

    get "/cats" => "cats#index"

    get "/cats/new" => "cats#new"

    post "/cats" => "cats#create"

    get "/cats/:id" => "cats#show"

    get "/cats/:id/edit" => "cats#edit"

    patch "/cats/:id" => "cats#update"

    delete "/cats/:id" => "cats#destroy"

  end

end
