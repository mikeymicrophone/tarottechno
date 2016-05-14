Rails.application.routes.draw do
  resources :positions
  resources :spreads
  resources :readings
  resources :events
  devise_for :readers
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
  
  resources :readers, :only => [:index] do
    member do
      put :activate
      put :deactivate
    end
  end
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
