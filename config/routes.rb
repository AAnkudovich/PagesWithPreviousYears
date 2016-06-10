Rails.application.routes.draw do
  resources :associations, :path => 'a'
  devise_for :users
  devise_scope :user do
	 get "/login" => "devise/sessions#new"
	end
  resources :pages , :path => 'p'
  root to: "information#home"
  get 'information/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
