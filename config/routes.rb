PpPeru::Application.routes.draw do

  devise_for :users

  root :to => "news#index"
  mount Ckeditor::Engine => '/ckeditor'
  resources :users

  resources :news_actors, only: [:show, :index] do
    collection do
      post :rates
    end
  end

  scope '/centro_de_medios' do
    resources :noticias, controller: :news, only: [:show, :index] do
      resources :comentarios, controller: :annotations, only: :create
      collection do
        post :rates
      end
    end
  end
  
  scope '/centro_educacional' do
    resources :entradas, controller: :entries, only: [:show, :index]
  end
  
  scope '/centro_de_debate' do
    resources :debates, controller: :discussions, only: [:show, :index] do
      resources :comentarios, controller: :annotations, only: [:create, :new]
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
    resources :news_actors
  end
end
