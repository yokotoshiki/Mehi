Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users' => 'users/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'users/passwords#new', as: 'new_user_password'
  end

  devise_for :admin, skip: :all
  devise_scope :admin do
    get 'admin/sign_in' => 'admin/sessions#new', as: 'new_admin_session'
    post 'admin/sign_in' => 'admin/sessions#create', as: 'admin_session'
    delete 'admin/sign_out' => 'admin/sessions#destroy', as: 'destroy_admin_session'
  end

  root to: 'users/recipes#top'
  namespace :users do
    get 'recipes/collections' => 'recipes#collection'
    resources :recipes do
      resource :favorites, only: [:create, :destroy]
      resource :interests, only: [:create, :destroy]
    end
    resources :stores, only: [:index,:show]
    resources :ingredients
    resources :calendars
    resources :users, only: [:show,:index,:edit,:update]
  end

  namespace :admin do
    resources :stores
    resources :recipe_categories, except: [:new, :show]
    resources :store_categories, except: [:new, :show]
    resources :ingredient_categories, except: [:new, :show]
    resources :tags, except: [:new, :show]
  end
  get 'home/about' => 'home#about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
