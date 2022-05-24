Rails.application.routes.draw do
  resource :session, only: %i[new show create destroy]
  resources :admins, only: %i[index show new create edit update destroy]
  resources :books, only: %i[index show new edit create update destroy]
  resources :genres, only: %i[index show new edit create update destroy]
  resources :authors, only: %i[index show new edit create update destroy]
  root 'books#index'
end
