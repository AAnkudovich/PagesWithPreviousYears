Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :categories
  resources :associations, :path => 'a'
  devise_for :users
  devise_scope :user do
	 get "/login" => "devise/sessions#new"
	end
  resources :pages , :path => 'p' do
    collection { post :sort}
  end
  root to: "information#home"
  get 'information/home'
  get 'information/most_viewed_pages'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
