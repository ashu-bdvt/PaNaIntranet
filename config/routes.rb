Panaintranet::Application.routes.draw do
  resources :leave_types

  resources :devices

  devise_for :users

  resources :holidays

  resources :projects

  resources :employees

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Customised regular route:

  #This line will root the request to the home controller and display the template home.html.erb 
 # match '/', :controller=>'home', :action=>'index'
  match '/', :controller=>'home', :action=>'index2'
  
  #This line will root the request to the users controller and display the login page
  match 'user/', :controller=>'users', :action=>'new'

  #This line will root the request to the users controller and display the succcess message
  match 'user/create', :controller=>'users', :action=>'create'
     
  #This line will root the request to the emailer controller and display the template email.html.erb 
  match 'email/', :controller=>'emailer', :action=>'email'

  #This line will root the request to the emailer controller and display the success message for the email sent 
  match 'email/send', :controller=>'emailer', :action=>'sendmail'
  
  #This line will root the request to the leaves controller and display the index.html.erb template
  match '/leaves', :controller=>'leaves', :action=>'index'

  #This line will root the request to the leaves controller and display the _form.html.erb template
  match 'leaves/new', :controller=>'leaves', :action=>'new'
  
  #This line will root the request to the leaves controller and display the index.html.erb template
  match 'leaves/create', :controller=>'leaves', :action=>'create'
  
  #This line will root the request to the leaves controller and display the show.html.erb template
  match 'leaves/destroy', :controller=>'leaves', :action=>'destroy'
 
  #This line will root the request to the leaves controller and display the show.html.erb template
  match 'leaves/update', :controller=>'leaves', :action=>'update'

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   #root :to => 'homes#main'

   
   #match 'home', :to => "static#index"
   #root :to => "static#index"
   

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
