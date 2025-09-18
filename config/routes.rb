Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/new'
  get 'tasks/edit'
  root "books#index"
  resources :books do
    member do
      get :confirm_delete
    end
  end
end
