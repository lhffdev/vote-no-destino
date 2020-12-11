json.votos @votos, partial: "votos/voto", as: :voto

json.votos_participante do
  json.call(@votos_participante.first, :nome_participante, :email_participante)
  json.destinos @votos_participante do |voto|
    json.call(voto, :nome_destino, :quantidade_votos)
  end
end if @votos_participante&.any?
