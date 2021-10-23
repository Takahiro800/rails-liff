Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  namespace :admin do
    get 'users/index'
  end
  devise_for :admin_users, controllers: {
		sessions: 'admin_users/sessions',
		passwords: 'admin_users/passwords',
	}
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'admin/users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
