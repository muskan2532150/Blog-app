Rails.application.routes.draw do
  get 'likes/new'
  root "users#index"
  
  resources :users ,only:[:index,:show]do
    resources :posts ,only:[:index,:show, :new,:create] do
      resources :comments ,only:[:new, :create]
      resources :likes ,only:[:new,:create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
