require 'test_helper'

class DestinosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @destino = destinos(:one)
  end

  test "should get index" do
    get destinos_url, as: :json
    assert_response :success
  end

  test "should create destino" do
    assert_difference('Destino.count') do
      post destinos_url, params: { destino: { descricao: @destino.descricao, nome: @destino.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show destino" do
    get destino_url(@destino), as: :json
    assert_response :success
  end

  test "should update destino" do
    patch destino_url(@destino), params: { destino: { descricao: @destino.descricao, nome: @destino.nome } }, as: :json
    assert_response 200
  end

  test "should destroy destino" do
    assert_difference('Destino.count', -1) do
      delete destino_url(@destino), as: :json
    end

    assert_response 204
  end
end
