# Users.rb

require "sinatra"
require "sinatra/json"
require_relative "../Common/Common"
require_relative "../Model/UsersModel"

# Operations
################################

post '/users/v1/login?' do
	
	# Check specific headers for the login
	check_headers(['X-Timestamp', 'X-Authorization-Version'])

	# Check parameters
	check_params(['username', 'password'])
	
	# Specific Logic
	if params[:password] != 'pass'

		# Returning an error
		halt render_error(:not_authenticated, 'Please check your e-mail address and password')
	end

	# Search for the user
	users.each { |user|
		if user.user_info.email == params[:username]
			@user = user
		end
	}

	# If there isn't a user, that's an error
	if not @user
		halt render_error(:not_authenticated, 'Please check your e-mail address and password')
	
	# Else, everything is ok, we found the user
	else
		json @user
	end
end