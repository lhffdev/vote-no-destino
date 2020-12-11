require 'test_helper'

class VotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voto = votos(:one)
  end

  test "should get index" do
    get votos_url, as: :json
    assert_response :success
  end

  test "should create voto" do
    assert_difference('Voto.count') do
      post votos_url, params: { voto: { participante_id: @voto.participante_id } }, as: :json
    end

    assert_response 201
  end

  test "should show voto" do
    get voto_url(@voto), as: :json
    assert_response :success
  end

  test "should update voto" do
    patch voto_url(@voto), params: { voto: { participante_id: @voto.participante_id } }, as: :json
    assert_response 200
  end

  test "should destroy voto" do
    assert_difference('Voto.count', -1) do
      delete voto_url(@voto), as: :json
    end

    assert_response 204
  end
end
