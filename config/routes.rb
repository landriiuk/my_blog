Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'welcome#index'
  get 'welcome/index'

  resources :articles
  
end
