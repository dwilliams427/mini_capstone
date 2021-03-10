Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #orders
    post "/orders", controller: "orders", action: "create"
    get "/orders", controller: "orders", action: "index"
    get "/orders/:id", controller: "orders", action: "show"

    #users
    post "/users", controller: "users", action: "create"

    #sessions
    post "/sessions", controller: "sessions", action: "create"
    # get "/sessions", controller: "sessions", action: "create"

    #products
    #segment param
    # get "/single_product/:product" => "products#get_single_product"
    # #query param
    # get "/single_product" => "products#get_single_product"
    #RESTful index
    get "/products", controller: "products", action: "index"
    #RESTful show
    get "/products/:id", controller: "products", action: "show"
    #RETSful create
    post "/products", controller: "products", action: "create"
    #RESTful update
    patch "/products/:id", controller: "products", action: "update"
    #RESTful delete
    delete "/products/:id", controller: "products", action: "destroy"

    #suppliers
    #RESTful index
    get "/suppliers", controller: "suppliers", action: "index"
    #RESTful show
    get "/suppliers/:id", controller: "suppliers", action: "show"
    #RESTful create
    post "/suppliers", controller: "suppliers", action: "create"
    #RESTful update
    patch "/suppliers/:id", controller: "suppliers", action: "update"
    #RESTful delete
    delete "/suppliers/:id", controller: "suppliers", action: "destroy"

    #suppliers
    #RESTful index
    get "/suppliers", controller: "suppliers", action: "index"
    #RESTful show
    # get "/suppliers/:id", controller: "suppliers", action: "show"
    #RETSful create
    post "/suppliers", controller: "suppliers", action: "create"
    #RESTful update
    # patch "/suppliers/:id", controller: "suppliers", action: "update"
    #RESTful delete
    # delete "/suppliers/:id", controller: "suppliers", action: "destroy"
  end
end
