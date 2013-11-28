Cosc617app::Application.routes.draw do


  resources :journal_comments

  resources :review_requests

  resources :messages

  resources :private_forums do
    member do
      get :messages
    end
  end

  resources :tution_sessions

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
  
  resources :users do
    collection do
      get :schedules
    end
  end

  resources :journals do
    resources :entries do
      member do
        get :review
      end
    end
  end
  
  resources :articles

end

