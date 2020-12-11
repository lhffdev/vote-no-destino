class VotoDetalhe < ApplicationRecord
  validates :destino_id, presence: { message: 'É obrigatório informar o destino.' }

  belongs_to :voto, optional: true
  belongs_to :destino, optional: true
end
