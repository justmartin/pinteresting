Rails.application.routes.draw do

  resources :pins
  devise_for :users
  root "pins#index"
  get "/nineties" => "nineties#index"
  get "/about" => "pages#about"
  
end
