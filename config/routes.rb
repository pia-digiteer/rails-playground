Rails.application.routes.draw do
  # format: "[controller name without suffix]#[method name]"
  root "home#index"
  get "page", to: "home#page"
end
