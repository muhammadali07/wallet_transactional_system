# config/routes.rb
Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  get 'stocks/price', to: 'stocks#price'
  get 'stocks/prices', to: 'stocks#prices'
  get 'stocks/price_all', to: 'stocks#price_all'
end
