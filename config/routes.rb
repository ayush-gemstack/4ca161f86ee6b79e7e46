Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "questions#index"
  resources :questions do
    resources :answers
  end
  resources :users do
    member do
      post 'follow'
    end
  end
  resources :topics do
    member do
      post 'follow'
    end
  end
end
