require 'minitest/autorun'

class SetUserLoginProviderServiceTest < Minitest::Test
  def test_user_creation_with_invalid_args
    args = {
      'info' => {
        'email' => 'invalid_email'
      }
    }

    user = SetUserLoginProviderService.call(args)
    assert_equal false, user
  end

  def test_create_login_provider
    user = FactoryBot.create(:user, email: 'update@example.com')

    args = {
      'info' => {
        'email' => 'update@example.com',
        'first_name' => 'Jane',
        'last_name' => 'Smith',
        'name' => 'Jane Smith'
      }
    }

    SetUserLoginProviderService.call(args)
    user.reload

    assert_equal 'Jane', user.first_name
    assert_equal 'Smith', user.last_name
    assert_equal 'Jane Smith', user.username

    login_provider = user.login_providers.last
    assert_instance_of LoginProvider, login_provider
  end
end
