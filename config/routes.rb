Rails.application.routes.draw do
  get "brands/fetch"
  resources :products
  # format: "[controller name without suffix]#[method name]"
  root "home#index"

  get "page", to: "home#page"
  get "store", to: "products#index"

  get "/logos/fetch", to: "logos#fetch" # api fetch for brand images
end
