Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/products' => 'products#index'   #displays all products
  get '/products/new' => 'products#new' #displays the form to create a new product
  post '/products' => 'products#create' #Adds the new  product and displays the success message.
  get '/products/:id' => 'products#show' #shows a specific product when entering a number after /products
  get '/products/:id/edit' => 'products#edit' #Displays a form for editing a product
  patch '/products/:id' => 'products#update' #updates the product.
  delete '/products/:id' => 'products#delete' #deletes a specific product.
  get '/search' => 'products#search' #search for a paticular product or products

  get '/signup' => 'users#new'
	post '/users' => 'users#create'

  get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

  get '/orders/:id' => 'orders#show'
  post "/orders" => 'orders#create'



  get '/images/new' => 'images#new'
  post '/images' => 'images#create'


  get '/carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'
  patch '/carted_products/:id' => 'carted_products#update' #updates the product.

end
