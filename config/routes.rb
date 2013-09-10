TemplateApp::Application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  devise_for :users

  namespace :admin do
    root to: "admin#index"
  end

  scope module: :front do
    resources :users, only: [:new, :create, :edit, :update]
  end

end
