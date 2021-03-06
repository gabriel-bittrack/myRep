Rails.application.routes.draw do
  devise_for :shops
  root to: 'static_pages#index'
  get 'slot_machine', to: 'static_pages#slot_machine'

  controller :sessions do
    get 'auth/shopify/callback' => :callback
  end

  controller :static_pages do
    get 'login', to: :login
  end

  namespace :api do
    scope 'v1' do
      resources :popup_submits,    only: [:create]
      resource  :popup_activation, only: [:create]
    end

    namespace :internal do
      namespace :v1 do
        resources :slot_items, only: [:index, :update]
        resource :popup_config, only: [:show, :update] do
          get 'update_version', to: 'popup_configs#update_version'
        end

        resources :popup_submits, only: [:destroy, :index] do
          get 'save_as_csv', to: 'popup_submits#save_as_csv', on: :collection
        end

        resource :shop, only: [:show, :update]
        resource :subscription, only: [:create, :destroy]
      end
    end
  end


  scope :scripts do
    get 'js', to: 'scripts#javascript'
  end
end
