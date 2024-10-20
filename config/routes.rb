Rails.application.routes.draw do
  resources :categories
  resources :tasks do
    member do
      get 'toggle_status'
    end
  end
  root 'categories#index'
  get 'index_task', to: 'tasks#index', as: 'incomplete'
  get 'complete_task', to: 'tasks#complete', as: 'complete'
  get 'tasks/:id/toggle_status', to: 'tasks#toggle_status', as: 'toggle_status'

end

