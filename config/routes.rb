Rails.application.routes.draw do
  resources :tags, only: %i[index new create show edit update destroy]
  resources :users, only: %i[index new create show edit update destroy]
  namespace :admin do
    get 'users/index'
  end
  devise_for :admin_users, controllers: {
		sessions: 'admin_users/sessions',
		passwords: 'admin_users/passwords',
	}
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  post '/callback' =>   'linebot#callback'
  root 'tags#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
