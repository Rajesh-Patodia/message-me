Rails.application.routes.draw do
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login' , to: 'welcome#login'
  
end
