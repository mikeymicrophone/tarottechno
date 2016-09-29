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
  resources :cards
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
  end
  
  get '/querents' => 'querents#index'
  patch '/querents/approve_avatar/:id' => 'querents#approve_avatar', :as => 'approve_avatar'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'logistics#index'

  post 'add_me_to_mail_list' => 'mailing#add_name'

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
