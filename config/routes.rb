subdomains = {
  api: 'api',
  admin: 'admin',
  developers: 'developers'
}
subdomains = Hash[subdomains.map{|k, v| [k, "#{v}.staging"]}] if Rails.env.staging?

IntranetSXB::Application.routes.draw do

  as :user do
      match '/user/confirmation' => 'users/confirmations#update', via: :put, as: :update_user_confirmation
  end
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }

  constraints subdomain: subdomains[:api] do
    scope module: :api, as: :api do
      root to: redirect(subdomain: subdomains[:developers])
      scope module: :v1, constraints: ApiConstraint.new(version: 1, default: :true), format: :json do
        resources :users, only: :show do
          get :self, on: :collection
          get :search, on: :collection
        end
        resources :promotions, only: [:index, :show]
      end
    end
  end

  constraints subdomain: subdomains[:admin] do
    mount RailsAdmin::Engine => '/', as: 'rails_admin'
  end

  namespace :trombi do
    root to: 'promotions#index'
    resources :users, only: :show
    resources :promotions, only: :show
  end

  # /gallery
  namespace :gallery do
    root to: 'gallery#index'
    resources :albums, except: :index do
      resources :photos
    end
  end

  # Add a document without taking care of the matter
  match "/courses/new" => "courses/documents#new", via: :get, as: :new_courses_document
  # /courses => courses_path
  namespace :courses do
    # /courses/matter_id: courses_matter_documents
    resources :matters, only: [:show, :destroy, :index] , path: '' do
      # /courses/:matter_id/doc_id: courses_matter_documents(d)
      resources :documents, path: ''
    end
  end

  constraints subdomain: subdomains[:developers] do
    scope module: :developers, as: :developers do
      root to: 'documentation#show', id: 'homepage'
      namespace :documentation, path: 'doc' do
        get ':id', action: 'show', as: :static
      end
    end
    use_doorkeeper do
      skip_controllers :authorizations, :tokens, :authorized_applications
      controllers applications: 'developers/oauth/applications'
    end
  end

  resource :account, only: [:edit, :update] do
    put :update_password
  end

  use_doorkeeper do
    skip_controllers :applications
    controllers authorized_applications: 'oauth/authorized_applications'
  end

  root to: 'intranet#index'
end
