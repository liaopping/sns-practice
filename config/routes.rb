Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  root 'posts#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get 'contacts', to: 'contacts#index'
  post 'contacts', to: 'contacts#create'

  resources :users, only: %i[index new create show]
  resources :posts, shallow: true do
    collection do
      get :search
    end
    resources :comments
  end
  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resources :activities, only: [] do
    patch :read, on: :member
  end

  resources :chatrooms, only: %i[create show], shallow: true do
    resources :messages
  end

  namespace :mypage do
    resource :account, only: %i[edit update]
    resources :activities, only: %i[index]
    resource :notification_setting, only: %i[edit update]
  end
end
