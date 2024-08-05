Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :providers
      end
      resources :users, only: [] do
        collection do
          get :profile
          get :providers
        end
      end
      resources :providers, only: [:index, :show]
    end
  end

  get 'update_payment_status', to: "api/v1/trips#update_payment_status"

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
end
