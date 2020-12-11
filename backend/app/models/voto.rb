class Voto < ApplicationRecord
  validates :participante_id, presence: { message: 'É obrigatório informar o participante.' }

  validates :voto_detalhes, length: {
    is: 3,
    message: 'É obrigatório informar três destinos para realizar a votação.'
  }, if: proc { |record| record.new_record? }

  belongs_to :participante, optional: true
  
  has_many :voto_detalhes, dependent: :destroy, autosave: true

  def self.agrupado_por_destino
    select('
      destinos.nome as nome_destino,
      count(1) as quantidade_votos
    ')
    .left_outer_joins({voto_detalhes: :destino})
    .group('destinos.nome')
    .order('count(1) desc')
  end

  def self.filtra_participante(email)
    agrupado_por_destino
    .select('
      participantes.nome as nome_participante,
      participantes.email as email_participante
    ')
    .left_outer_joins(:participante)
    .where(participantes: {email: email})
    .group('
      participantes.nome,
      participantes.email
    ')
  end
end
