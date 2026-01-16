Rails.application.routes.draw do
  resources :blogs do
    member do
      patch :publish
      post :like
    end

    collection do
      get :drafts
    end

    resources :comments, only: [:create, :destroy]
  end

  root "blogs#index"
end
