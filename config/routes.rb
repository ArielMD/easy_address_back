Rails.application.routes.draw do
  namespace :api do
    resources :addresses, only: %i[index show create update destroy]
  end
end
