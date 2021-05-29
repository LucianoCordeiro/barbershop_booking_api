Rails.application.routes.draw do

  post 'signup', to: "users#signup"
  post 'login', to: "users#login"
  get 'me', to: "users#me"
end
