Rails.application.routes.draw do
  scope defaults: {format: :json} do
    resources :votos
    resources :destinos, only: %i[index]
  end
end
