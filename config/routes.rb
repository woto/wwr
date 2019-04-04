Rails.application.routes.draw do

  namespace :ajax do
    resources :feeds, only: :index
  end

  resources :feeds, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
