Rails.application.routes.draw do
  get "forum/index"
  get "home/index"
  devise_for :users

  get "/about", to: "home#about"
  root "home#index"

  get "/forum", to: "forum#index", as: "forums"
  get "/forum/new", to: "forum#new", as: "new_forum"
  post "/forum", to: "forum#create", as: "forums_create"
  get "/forum/:id", to: "forum#show", as: "forum"
  post "/forum/:forum_id/comments", to: "forum#create_comment", as: "forum_comments"
  delete "/forum/:id", to: "forum#destroy", as: "destroy_forum"
  delete "/forum/:forum_id/comments/:comment_id", to: "forum#destroy_comment", as: "destroy_comment"
  get "up" => "rails/health#show", as: :rails_health_check
end
