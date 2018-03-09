Rails.application.routes.draw do
  resources :tasks
  resources :comments
  resources :projects

  root to: 'pages#home'
  
  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end
end
