Rails.application.routes.draw do

  authenticate :user do
    resources :users
    get 'profile' => "users#profile"
    
    root 'dashboard#index'
  end

  devise_for :users,
   path: "",
   path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "signup"
   }
end
