Rails.application.routes.draw do
  get 'login', to: 'sessions#new'      # Route to display the login form
  post 'login', to: 'sessions#create'  # Route to handle login form submission
  delete 'logout', to: 'sessions#destroy'  # Route to handle logout

  resources :users, only: [:new, :create]  # Routes for user registration (sign up)
  resources :places                        # Resource routes for places

  root 'welcome#index'  # Root route, directs to the welcome controller's index action
end
