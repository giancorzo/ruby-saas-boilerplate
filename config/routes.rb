Rails.application.routes.draw do

  authenticate :user do
    resources :users
    root 'dashboard#index'
  end

  resources :accounts, only: [:new, :create]

  devise_for :users,
   path: "",
   path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "signup"
  }

end
