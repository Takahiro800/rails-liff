Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
  end
  devise_for :admin_users
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
