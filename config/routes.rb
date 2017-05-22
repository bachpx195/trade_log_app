Rails.application.routes.draw do
 scope "(:locale)", locale: /en|vi/ do
  get "/pages/*page", to: "pages#show"
  root "pages#show", page: "home"
 end
end
