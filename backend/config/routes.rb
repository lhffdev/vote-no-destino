Rails.application.routes.draw do
  scope defaults: {format: :json} do
    resources :votos,  only: %i[index create]
    resources :destinos, only: %i[index]
  end
end
