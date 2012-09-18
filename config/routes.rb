PpPeru::Application.routes.draw do

  devise_for :users

  root :to => "news#index"
  mount Ckeditor::Engine => '/ckeditor'
  
  resources :usuarios, controller: :users do
    resources :seguidores, controller: 'users_activities/followers', only: [:create, :destroy]
  end

  match '/auth/:provider/callback', to: 'authentications#create'

  resources :news_actors, only: [:show, :index] do
    collection do
      post :rates
    end
  end

  scope '/centro_de_medios' do
    resources :noticias, controller: :news, only: [:show, :index] do
      resources :comentarios, controller: :annotations, only: [:create, :new]
      collection do
        post :rates
      end
    end
  end
  
  scope '/centro_educacional' do
    resources :entradas, controller: :entries, only: [:show, :index] do
      resources :comentarios, controller: :annotations, only: [:create, :new]
    end
  end
  
  scope '/centro_de_debate' do
    resources :debates, controller: :discussions, only: [:show, :index] do
      resources :comentarios, controller: :annotations, only: [:create, :new]
      resources :votes, controller: 'discussions_activities/votes', only: :create
    end
  end
  scope '/propuesta_ciudadana' do
    resources :propuestas, controller: :proposals, except: :destroy do
      resources :comentarios, controller: :annotations, only: [:create, :new]
      resources :votes, controller: 'proposals_activities/votes', only: :create
    end
  end
  
  resources :annotations, only: :index do
    resources :reports, only: :create
    resources :reviews_admins, only: :create
  end

  namespace :admin do
    root to: 'home#index'
    resources :news do
      resource :publish, controller: 'news_actions/publish', only: :create
      resource :archive, controller: 'news_actions/archive', only: :create
    end
    
    resources :discussions do
      resources :open_discussion, controller: 'discussions_actions/open_discussion', only: :create
      resources :close_discussion, controller: 'discussions_actions/close_discussion', only: :create
      resources :archive_discussion, controller: 'discussions_actions/archive_discussion', only: :create
    end
    

    resources :proposals do
      resource :publish, controller: 'proposals_actions/publish', only: :create
      resource :archive, controller: 'proposals_actions/archive', only: :create
    end

    resources :entries do
      resource :publish, controller: 'entries_actions/publish', only: :create
      resource :archive, controller: 'entries_actions/archive', only: :create
    end
    
    resources :topics, only: :index
    resources :news_actors
  end
end
