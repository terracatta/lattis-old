Lattis::Application.routes.draw do
  resources :task_types

  resources :studies

  resources :stimulations

  resources :stimulation_types

  resources :stimulation_sub_types

  resources :stimulation_sub_sub_types

  resources :stimulation_sessions

  resources :stimulation_device_sessions

  resources :scans

  resources :scan_types

  resources :scan_sessions

  resources :scan_formats

  resources :races

  resources :populations

  resources :motor_thresholds

  resources :locations

  resources :exams

  resources :ethnicities

  resources :enrollments

  resources :devices

  resources :device_models

  resources :brain_areas

  devise_for :users

  #
  # Only allow delayed_jobs if you are an administrator
  #
  constraints CanAccessDelayedJobs do
      match "/admin/jobs" => DelayedJobWeb, :anchor => false
  end

  resources :users do
    member do
      get 'change_password'
      put 'update_password'
    end
  end

  root :to => 'pages#home'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
