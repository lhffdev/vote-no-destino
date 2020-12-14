require 'rails_helper'

RSpec.describe Participante, type: :model do
  context 'cricação de um participante.' do
    it 'não permitir criar um participante vazio.' do
      participante = Participante.new

      expect(participante).to_not be_valid
    end

    it 'não permitir criar um participante sem um campo obrigatório.' do
      participante = Participante.new(nome: FFaker::Name.first_name)

      expect(participante).to_not be_valid
    end

    it 'permitir criar um participante com todos os dados obrigatórios informados.' do
      participante = Participante.new(
        nome: FFaker::Name.first_name,
        email: FFaker::Internet.email
      )
      
      expect(participante).to be_valid
    end
  end
end
