class UserFromLoginProviderService
	def initialize(args)
		@args = args
	end

	def self.call(args)
		new(args).user
	end

	def user
		provider = LoginProvider.find_by(provider: args['provider'], uid: args['uid'])
		return provider.user if provider.present?

		user = User.find_or_create_by!(email: args.dig('info', 'email'))
		user.login_providers.create(provider: args['provider'], uid: args['uid'])
		user
	end

	private

	attr_reader :args
end
