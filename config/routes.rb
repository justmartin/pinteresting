Rails.application.routes.draw do

  resources :pins
  devise_for :users
  root "pins#index"
  get "/nineties" => "pins#nineties"
  get "/eighties" => "pins#eighties"
  post 'comments' => 'comments#create', as: "create_comment"
  
end
