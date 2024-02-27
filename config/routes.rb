Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: "homes#top"
    get 'homes/about' => 'homes#about', as: :about
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
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
     
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
