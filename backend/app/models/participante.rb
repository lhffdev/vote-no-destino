class Participante < ApplicationRecord
  validates :nome, presence: { message: 'É obrigatório informar o nome do participante.' }
  validates :email, presence: { message: 'É obrigatório informar o email do participante.' }

  has_one :voto, dependent: :destroy
end
