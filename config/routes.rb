Rails.application.routes.draw do

  authenticate :user do
    resources :users
    root 'dashboard#index'
  end

  devise_for :users
end
