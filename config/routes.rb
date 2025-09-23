Rails.application.routes.draw do
  resources :products
  # format: "[controller name without suffix]#[method name]"
  root "home#index"
  get "page", to: "home#page"
end
