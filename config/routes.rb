Rails.application.routes.draw do
  root "regions#index"

  get 'feed', to: 'users#show'
  get 'subscribe', to: 'pages#landing'
  get 'user/:id', to: 'users#info'

  match 'subscribe', to: 'user_region_relations#subscribe', via: :post
  match 'unsubscribe', to: 'user_region_relations#unsubscribe', via: :delete
  match 'like', to: 'likes#like', via: :post
  match 'unlike', to: 'likes#unlike', via: :delete
  match 'dislike', to: 'dislikes#dislike', via: :post
  match 'undislike', to: 'dislikes#undislike', via: :delete

  resources :comments do
    member do
      post 'create'
    end
  end

  resources :subscribers, only: [:create]
  resources :regions, param: :slug do
    resources :events, param: :slug
    resources :posts, param: :slug
  end

  resources :events do
    resources :comments
  end

  resources :posts do
    resources :comments
  end


  devise_for :users, controllers: { :omniauth_callbacks => "users/facebook_callbacks", registrations: "registrations" }

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/devel/emails"
  end
end
