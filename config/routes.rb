Rails.application.routes.draw do
  root "home#index"
  get "page", to: "home#page"
end
