PpPeru::Application.routes.draw do
  devise_for :users
  root :to => "news#index"
  mount Ckeditor::Engine => '/ckeditor'

  #devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  resources :news, only: [:show, :index] do
    resources :annotations
    collection do
      post :rates
    end
  end

  resources :news_actors, only: [:show, :index] do
    collection do
      post :rates
    end
  end

  namespace :admin do
    root to: 'home#index'
    resources :news do
      resource :publish, controller: 'news_actions/publish', only: :create
      resource :archive, controller: 'news_actions/archive', only: :create
    end
    resources :discussions do
      get :topics, on: :collection
    end
    resources :proposals
    resources :entries do
      get :topics, on: :collection
    end
    resources :news_actors, only: :index
  end
end
