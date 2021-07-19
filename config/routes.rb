Rails.application.routes.draw do
  get 'home/top'=>"home#top"
  get '/'=>"home#top"
  post 'home/post'=>"home#post"
  get 'home/:id/delete'=>"home#delete"
  get 'home/:id/edit'=>"home#edit"
  post 'home/:id/edit' => "home#edit_save"
  post 'edit'=>"home#edit"

  get 'login' =>"user#login_form"
  post 'user/login' =>"user#login"
  get 'user/edit' =>"user#edit"
  get 'user/:id/edit'=>"user#edit_form"
  post 'user/:id/edit'=>"user#save"
  get 'user/:id/delete'=>"user#delete"
  get 'login/new' =>"user#user_new"
  post 'user/new' =>"user#create"
  get 'logout' => "user#logout"


  #get 'home/delete/:id'=>"home#confirm"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
