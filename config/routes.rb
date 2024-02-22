Rails.application.routes.draw do
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admin, skip: [:registrations], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: "events#index"
    get '/top' => 'homes#top'
    get 'about' => 'homes#about', as: :about
    resources :users, only: [:show, :edit, :update, :destroy] do
      member do
        get  'unsubscribe'
      end
    end
    
    resources :events
      resource :favorite, only: [:create, :destroy]
    end
    
  namespace :admin do
    root to: "users#index"
    resources :users, only: [:index, :show, :edit, :update]
  end
     
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
