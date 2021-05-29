Rails.application.routes.draw do

  post 'signup', to: "users#signup"
  post 'login', to: "users#login"
  get 'me', to: "users#me"

  get 'booking_times', to: "booking#booking_times"
  get 'current_booked_time', to: "booking#current_booked_time"
  put 'book', to: "booking#book"
  put 'cancel', to: "booking#cancel"
end
