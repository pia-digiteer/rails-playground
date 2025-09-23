Rails.application.routes.draw do
  resources :products
  # format: "[controller name without suffix]#[method name]"
  root "products#index"
  get "page", to: "home#page"
end
