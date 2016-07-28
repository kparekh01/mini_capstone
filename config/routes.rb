Rails.application.routes.draw do
  get '/products' => 'products#index'   #displays all products 
  get '/products/new' => 'products#new' #displays the form to create a new product
  post '/products' => 'products#create' #Adds the new  product and displays the success message.
  get '/products/:id' => 'products#show' #shows a specific product when entering a number after /products
  get '/products/:id/edit' => 'products#edit' #Displays a form for editing a product
  patch '/products/:id' => 'products#update' #updates the product.
  delete '/products/:id' => 'products#delete' #deletes a specific product.
end
