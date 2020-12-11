class DestinosController < ApplicationController
  def index
    @destinos = Destino.all
  end
end
