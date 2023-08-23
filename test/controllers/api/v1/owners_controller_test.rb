require 'test_helper'

class Api::V1::OwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, email: 'update1@example.com')
    @token = Doorkeeper::AccessToken.create!(resource_owner_id: @user.id)
  end

  test 'should get show when authenticated' do
    get api_v1_owner_url, headers: { 'Authorization' => "Bearer #{@token.token}" }
    assert_response :success

    response_user = JSON.parse(response.body)
    assert_equal @user.id, response_user['id']
  end

  test 'should not get show when not authenticated' do
    get api_v1_owner_url
    assert_response :unauthorized
  end
end
