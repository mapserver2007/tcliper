ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resource :session

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "tcliper"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.

  # Main routing
  map.connect '', :controller => 'tcliper', :action => 'index'

  # Edit routing
  map.edit '/edit', :controller => 'tcliper', :action => 'edit'

  # restful authentication routing
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  # Private page routing
  map.myclip '/private/:id', :controller => 'private', :action => 'index'
  map.myconf '/private/:action/:id', :controller => 'private', :action => 'config'
  map.mygmdl '/private/:action/:id/:file', :controller => 'private', :action => 'download', :file => /tcliper\.user\.js/

  # Clip register routing
  map.clip '/clip', :controller => 'clips', :action => 'new'

  # Livedoor authback routing
  map.authback '/authback/:auth_token', :controller => 'tcliper', :action => 'authback'

  # Greasemonkey script download routing
  #map.download '/download', :controller => 'private', :action => 'download'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'


 # Comment edit routing
 #map.connect '/tcliper', :controller => 'project', :action => 'edit'

end
