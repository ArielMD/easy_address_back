Rails.application.routes.draw do
  namespace :api do
    resources :addresses, only: %i[index show create update destroy]

    get 'search/postal_code', to: 'searches#postal_code'
    get 'search/country', to: 'searches#country'
    get 'search/states', to: 'searches#state'
    get 'search/cities', to: 'searches#city'
    get 'search/municipalities', to: 'searches#municipality'
    get 'search/colonias', to: 'searches#colonia'
  end
end
