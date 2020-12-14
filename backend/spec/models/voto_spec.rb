require 'rails_helper'

RSpec.describe Voto, type: :model do
  context 'cricação de um voto.' do
    it 'não permitir criar um voto vazio.' do
      voto = Voto.new

      expect(voto).to_not be_valid
    end

    it 'não permitir criar um voto sem ter três destinos informados.' do
      voto = Voto.new(participante_id: FFaker::Random.rand(1...10000))

      expect(voto).to_not be_valid
    end

    it 'permitir criar um voto com todos os dados obrigatórios informados.' do
      voto = Voto.new(participante_id: FFaker::Random.rand(1...10000))
      voto.voto_detalhes = [
        VotoDetalhe.new(destino_id: FFaker::Random.rand(1...10000)),
        VotoDetalhe.new(destino_id: FFaker::Random.rand(1...10000)),
        VotoDetalhe.new(destino_id: FFaker::Random.rand(1...10000))
      ]
      
      expect(voto).to be_valid
    end
  end
end
