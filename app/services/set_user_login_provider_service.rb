class SetUserLoginProviderService
	def initialize(args)
		@args = args
	end

	def self.call(args)
		new(args).user
	end

	def user
  	user = User.find_by(email: args.dig('info', 'email'))
  	return false unless user.present? && update_user_attributes(user)

  	user.login_providers.find_or_create_by!(provider: args['provider'], uid: args['uid'])
  	user
	end

	private

	attr_reader :args

	def update_user_attributes(user)
    user.first_name = args.dig('info', 'first_name') unless user.first_name.present?
    user.last_name = args.dig('info', 'last_name') unless user.last_name.present?
    user.username = args.dig('info', 'name') unless user.username.present?

    Array(user.client.extra_fields).each do |field|
    	next if field.blank?

    	keys = field.split(':')
    	user.extra_information[keys.last] = args.dig(*keys) unless user.extra_information[keys.last].present?
    end

    user.save
  end
end

