Rails.application.routes.draw do
  devise_for :employees
  resources :challenges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'challenges#index'
  get '/challenges/upvote/:id/', to: "challenges#upvote", as: "upvote"
end