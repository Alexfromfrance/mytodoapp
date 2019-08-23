Rails.application.routes.draw do
  devise_for :users
  root to: "todolists#index"

  get 'taskdone', to: 'listitems#taskdone', as: :taskdone
  get 'adminshow', to: 'listitems#adminshow', as: :adminshow

  resources :todolists do
    resources :listitems, except:[:index]
    resources :users_todolists, only:[:create]
  end

  match 'todolists/:todolist_id/listitems/:id/complete' => 'listitems#complete', as: 'complete_listitem', via: :put

  root "todolists#index"

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.status == "admin" } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
