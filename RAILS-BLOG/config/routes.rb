Rails.application.routes.draw do
  # get 'comments/create'
#-------------------------------------
  # get 'messages/new'

  # get 'messages/create'
#-------------------------------------
  # get 'posts/index'

  # get 'posts/show'
#-------------------------------------
#-------------------------------------
  # namespace :admin do
  # get 'settings/new'
  # end

  # namespace :admin do
  # get 'settings/create'
  # end

  # namespace :admin do
  # get 'settings/edit'
  # end

  # namespace :admin do
  # get 'settings/update'
  # end
#-------------------------------------
  # namespace :admin do
  # get 'dashboard/index'
  # end
#-------------------------------------
  # namespace :admin do
  # get 'notifications/index'
  # end

  # namespace :admin do
  # get 'notifications/destroy'
  # end
#-------------------------------------
  # namespace :admin do
  # get 'messages/index'
  # end

  # namespace :admin do
  # get 'messages/show'
  # end

  # namespace :admin do
  # get 'messages/update'
  # end

  # namespace :admin do
  # get 'messages/destroy'
  # end
#-------------------------------------
  # namespace :admin do
  # get 'visitors/index'
  # end

  # namespace :admin do
  # get 'visitors/destroy'
  # end
#-------------------------------------
  # namespace :admin do
  # get 'comments/index'
  # end

  # namespace :admin do
  # get 'comments/update'
  # end

  # namespace :admin do
  # get 'comments/destroy'
  # end
#-------------------------------------
  # namespace :admin do
  # get 'tags/new'
  # end

  # namespace :admin do
  # get 'tags/create'
  # end

  # namespace :admin do
  # get 'tags/edit'
  # end

  # namespace :admin do
  # get 'tags/update'
  # end

  # namespace :admin do
  # get 'tags/show'
  # end

  # namespace :admin do
  # get 'tags/destroy'
  # end

  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'
  # namespace :admin do
  # get 'sessions/new'
  # end

  # namespace :admin do
  # get 'sessions/create'
  # end

  # namespace :admin do
  # get 'sessions/destroy'
  # end

  namespace :admin do
    resources :posts
    resources :moderators, only: [:index, :edit, :update]
    
    resources :sessions, only: [:new, :create, :destroy]
    resources :tags, except: [:index] #the only tags we don't want
    resources :comments, only: [:index, :update, :destroy] #only for these 3 methods
    resources :visitors, only: [:index, :destroy]
    resources :messages, only: [:index, :show, :update, :destroy]
    resources :notifications, only: [:index, :destroy]
    resources :dashboard, only: [:index]
    resources :settings, only: [:new, :create, :edit, :update]
  end
  match 'dismiss_all_notifications', to: 'admin/notifications#delete_all', via: :delete


  resources :posts, only: [:index, :show]
  resources :messages, only: [:new, :create]
  resources :comments, only: [:create]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'

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
