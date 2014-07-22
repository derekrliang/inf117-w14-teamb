GrammarBrushstrokes::Application.routes.draw do
  get "password_resets/new"

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "signup"
  resources :sessions
  resources :password_resets

  resources :announcements

  root :to => 'home#show'

  get 'admin' => 'home#admin', as: 'admin_home'
  get 'about' => 'home#about', as: 'about'
  
  resources :responses, only: [:new, :create, :update]
  get 'responses/review' => 'responses#review', as: 'review_response'
  get 'responses/revise' => 'responses#revise', as: 'revise_response'
  delete 'responses/course_responses' => 'responses#delete_course_responses', as: 'delete_course_responses'
  
  resources :categories, only: [:show]
  
  get 'users/generate_report' => 'users#generate_report', as: 'generate_report'
  resources :users do
    post :login, on: :collection, as: :login
  end
  
  resources :courses, only: [:new, :create]
  get 'courses/join' => 'courses#join', as: 'join_course'
  get 'courses/teach/:id' => 'courses#teach', as: 'teach_course'
  delete 'courses/students/:id' => 'courses#remove_student', as: 'remove_student'
  
  # Sessions
  get 'log_in' => 'sessions#new', :as => 'log_in'
  post 'validate_user' => 'sessions#create', :as => 'validate_user'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'

  # match '/login', to: 'session#login', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
