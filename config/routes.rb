Cosc617app::Application.routes.draw do



  resources :decks do
    resources :flashcards
  end

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'


  #resources :posts
  #resources :topics
  #resources :forums
  root 'static_pages#home', :as => "root"

  get '/login', to: 'sessions#new', as: 'log_in'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'log_out'
  get '/users/sign_in', to: 'sessions#new'

  get '/register', to: 'users#new', as: 'register'
  get '/learner_home', to: 'static_pages#learner', :as => "learner_home"
  get '/teacher_home', to: 'static_pages#teacher', :as => "teacher_home"

  resources :profiles
  resources :sessions
  resources :users

  resources :journals

  resources :entries

  resources :articles

end

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

