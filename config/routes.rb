Rails.application.routes.draw do
  devise_for :users
  root to: "todolists#index"

  get 'taskdone', to: 'listitems#taskdone', as: :taskdone

  resources :todolists do
    resources :listitems, except:[:index]
  end

  match 'todolists/:todolist_id/listitems/:id/complete' => 'listitems#complete', as: 'complete_listitem', via: :put

  root "todolists#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
