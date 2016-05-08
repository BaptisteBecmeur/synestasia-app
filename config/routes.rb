Rails.application.routes.draw do


  root to: 'pages#home'

  get 'synestesie', to: 'pages#synestesie'
  get 'about', to: 'pages#about'
  get 'start', to: 'pages#start'
  get 'contact', to: 'pages#contact'
  get 'legal', to: 'pages#legal'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :symboles do
    get 'japonais(/:type)', to: "symboles#japonais" , on: :collection
    post 'load_form' , on: :collection
    post 'load_attributes_form' , on: :collection
  end

  resources :sentences do
    get 'japonais(/:type)', to: "symboles#japonais" , on: :collection
    post 'load_form' , on: :collection
    post 'load_select_tag' , on: :collection
  end

  resources :teacher_requests do
    get 'validate', to: "teacher_requests#validate_teacher_request"
    get 'refuse', to: "teacher_requests#refuse_teacher_request"
    get 'cancel', to: "teacher_requests#cancel_teacher_request"
  end

  # Posts as articles from blog
  resources :categories
  resources :posts


  post 'favorites/:favoritable_id', to: 'favorites#create', as: "create_favorite"
  get 'favorites', to: 'favorites#index'
  delete 'favorites/:favoritable_id', to: 'favorites#destroy', as: "destroy_favorite"

end



  # get 'post_categories/index'
  # get 'post_categories/show'
  # get 'post_categories/new'
  # get 'post_categories/create'
  # get 'post_categories/edit'
  # get 'post_categories/update'
  # get 'post_categories/destroy'

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

