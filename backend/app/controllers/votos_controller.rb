class VotosController < ApplicationController
  def index
    @votos = Voto.agrupado_por_destino

    if params[:email_participante].present?
      @votos_participante = Voto.filtra_participante(params[:email_participante])
    end
  end

  def create
    with_transaction do
      error 'É obrigatório informar três destinos para realizar a votação.' if voto_detalhes_params&.length != 3

      participante = Participante.find_or_initialize_by(email: participante_params[:email_participante])
      participante.nome = participante_params[:nome_participante]
      
      error participante.errors unless participante.save

      voto = Voto.new(participante: participante)
      voto.voto_detalhes = voto_detalhes_params.map { |destino| VotoDetalhe.new(destino) }

      error voto.errors unless voto.save
    end
  end

  private

  def participante_params
    params.permit(
      :nome_participante,
      :email_participante
    )
  end

  def voto_detalhes_params
    params[:destinos]&.map do |destino|
      destino.permit(
        :destino_id
      )
    end
  end
end
