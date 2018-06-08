Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users, controllers: {
  #     sessions: 'users/sessions',
  #     registrations: 'users/registrations',
  #     confirmations: 'users/confirmations',
  #     passwords: 'users/passwords',
  # }

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :films do
    resources :film_comments
  end

  root to: 'pages#home'
  post "/contact_us", to: 'pages#send_message'
  get "/contact_us", to: 'pages#contact_us'
  post 'contact_us', to: 'pages#send_message', as: 'contact_us_post'
  get 'about_us', to: 'pages#about_us'
end
