FinalProject::Application.routes.draw do

  root :to => 'home#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

resources :users, :homeworks, :classrooms, :assignments, :questions, :tags, :responses, :answers

end
