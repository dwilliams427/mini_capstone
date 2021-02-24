Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products" => "products#all_products"
    get "/megapants" => "products#megapants"
    get "/air_fryer" => "products#air_fryer"
    get "/cheese" => "products#cheese"
  end
end
