Rails.application.routes.draw do
  get "collaboration/index"
  devise_for :users

  get "/manifest.json", to: "pwa#manifest", as: :pwa_manifest
  get "/service-worker.js", to: "pwa#service_worker"

  root "home#index"
  get "/about", to: "home#about"
  get "/contents", to: "home#contents", as: "contents"

  get "/collaboration", to: "collaboration#index", as: "collaboration"

  get "/tools/blueprinter", to: "tools#blueprinter", as: "tools_blueprinter"
  get "/tools", to: "tools#index", as: "tools"

  get "/forum", to: "forum#index", as: "forums"
  get "/forum/new", to: "forum#new", as: "new_forum"
  post "/forum", to: "forum#create", as: "forums_create"
  get "/forum/:id", to: "forum#show", as: "forum"
  post "/forum/:forum_id/comments", to: "forum#create_comment", as: "forum_comments"
  delete "/forum/:id", to: "forum#destroy", as: "destroy_forum"
  delete "/forum/:forum_id/comments/:comment_id", to: "forum#destroy_comment", as: "destroy_comment"

  get "up" => "rails/health#show", as: :rails_health_check
end
