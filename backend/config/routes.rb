require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'api/status#index'

  namespace :api do
    namespace :jobs do
      mount Sidekiq::Web => '/ui'
    end

    get '/', to: 'status#index'
  end
end
