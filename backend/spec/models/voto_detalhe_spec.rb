require 'rails_helper'

RSpec.describe VotoDetalhe, type: :model do
  context 'cricação do detalhe do voto.' do
    it 'não permitir criar um detalhe de voto vazio.' do
      voto_detalhe = VotoDetalhe.new

      expect(voto_detalhe).to_not be_valid
    end

    it 'não permitir criar um detalhe de voto sem um campo obrigatório.' do
      voto_detalhe = VotoDetalhe.new(voto_id: FFaker::Random.rand(1...10000))

      expect(voto_detalhe).to_not be_valid
    end

    it 'permitir criar um detalhe de voto com todos os dados obrigatórios informados.' do
      voto_detalhe = VotoDetalhe.new(
        voto_id: FFaker::Random.rand(1...10000),
        destino_id: FFaker::Random.rand(1...10000)
      )
      
      expect(voto_detalhe).to be_valid
    end
  end
end
