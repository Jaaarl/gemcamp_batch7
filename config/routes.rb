Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  get 'about_us', to: 'welcome#about_us'
  get 'contact', to: 'welcome#contact'
  resources :posts do
    resources :comments, except: :show
  end
  resources :categories, except: :show
end
