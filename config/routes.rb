Rails.application.routes.draw do
  # get 'stocks/index'
  # get 'blogs/index'
  # get '/blogs', to:'blogs#index'#blogsコントローラのindexアクションを起動する
  # get '/stocks', to:'stocks#index'
  root :to 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :contacts
end
