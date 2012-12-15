IntranetSXB::Application.routes.draw do

  as :user do
      match '/user/confirmation' => 'users/confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, controllers: {
    :confirmations => 'users/confirmations'
  }

  resources :ragots

  # /gallery
  namespace :gallery do
    root to: 'gallery#index'
    resources :albums, except: :index do
      resources :photos
    end
  end

  # /courses => courses_promos_path
  namespace :courses do
    # /courses/:promo => courses_promos_matters_path
    resources :promos, only: :index, path: '', on: :collection do
      # /courses/:promo/:matters => courses_promo_matter_documents
      resources :matters, only: :index, path: '' do
        # /courses/:promo/:matters/:doc_id => courses_promo_matter_documents(d)
        resources :documents, path: ''
      end
    end
  end

  namespace :admin do
    root to: 'users#index'
    resources :users
    resources :promotions do
      resources :users, path: 'students', only: :index
    end
  end

  constraints subdomain: 'developers' do
    scope module: :developers, as: :developers do
      root to: 'developers#homepage'
    end
    use_doorkeeper do
      skip_controllers :authorizations, :tokens, :authorized_applications
      controllers applications: 'developers/oauth/applications'
    end
  end

  constraints subdomain: 'api' do
    root to: redirect(subdomain: 'developers')
    scope module: :api do
      scope module: :v1, constraints: ApiConstraint.new(version: 1, default: :true), format: :json do
        resources :users, only: :show do
          get :search
        end
        resources :promotions, only: [:index, :show]
      end
    end
  end

  root to: 'intranet#index'
end
