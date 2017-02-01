Rails.application.routes.draw do
  resources :places do
    member do
      get :notify_querent
    end
  end
  resources :lines
  resources :appearances
  resources :positions
  resources :spreads
  resources :readings do
    member do
      put :complete
      put :make_private
      put :not_private
    end
  end
  resources :events do
    member do
      get :line_shift
    end
  end
  devise_for :readers
  devise_for :querents, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  get 'querents/:querent_id/readings' => 'readings#index', :as => 'querent_readings'
  get 'querents/revise' => 'querents#revise', :as => 'revise_querent'
  patch 'querents/redefine' => 'querents#redefine', :as => 'redefine_querent'
  
  get 'readers/revise' => 'readers#revise', :as => 'revise_reader'
  patch 'readers/redefine' => 'readers#redefine', :as => 'redefine_reader'
  resources :interpretations do
    member do
      get :rewrite
    end
  end
  resources :suits do
    resources :cards
    resources :decks
    resources :interpretations
    resources :readers
    member do
      get :card_names
    end
  end
  resources :cards do
    resources :interpretations
  end
  resources :decks do
    resources :cards
    resources :suits
    resources :interpretations
    resources :readers
  end
  resources :traditions do
    resources :decks
    resources :suits
    resources :cards
    resources :interpretations
  end
  resources :logistics
  
  resources :readers, :only => [:index, :edit, :update, :new] do
    collection do
      post :name
    end
    member do
      put :activate
      put :deactivate
    end
    resources :interpretations
  end
  
  get '/guildlines/dj' => 'logistics#dj_guildlines', :as => 'dj_guildline'
  get '/guildlines/reader' => 'logistics#reader_guildlines', :as => 'reader_guildline'
  
  get '/querents' => 'querents#index'
  patch '/querents/approve_avatar/:id' => 'querents#approve_avatar', :as => 'approve_avatar'

  root 'logistics#index'

  post 'add_me_to_mail_list' => 'mailing#add_name'
end
