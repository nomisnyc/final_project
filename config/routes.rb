FinalProject::Application.routes.draw do

  root :to => 'home#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/questions/finish/:assignment_id' => 'questions#finish'
  post '/start_quiz' => 'classrooms#assign'
  get '/sms' => 'sms#create'
  resources :users, :homeworks, :classrooms, :assignments, :questions, :tags, :responses, :answers

end
