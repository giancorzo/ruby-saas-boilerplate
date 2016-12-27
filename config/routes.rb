Rails.application.routes.draw do

  authenticate :user do
    root 'dashboard#index'
  end
  
  devise_for :users
end
