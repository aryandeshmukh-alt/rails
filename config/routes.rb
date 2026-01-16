Rails.application.routes.draw do
  resources :blogs do
    member do
      post :like
      patch :publish
    end

    collection do
      get :drafts
    end

    resources :comments, only: [:create, :destroy]
  end

  root "blogs#index"
end
