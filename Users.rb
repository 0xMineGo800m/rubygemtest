# Users.rb

require "sinatra"
require "sinatra/json"
require_relative "Common"

post '/users/v1/login?' do
	
	# Check special headers
	check_headers(['X-Timestamp', 'X-Authorization-Version'])

	# Check parameters
	check_params(['username', 'password'])
	
	# Specific Logic
	if params[:password] != 'pass'

		# Returning an error
		halt render_error(:not_authenticated, 'Please check your e-mail address and password')
	end

	# Good result
    json :user_token => '1qaz2wsx', 
    	 :user_info => { 
    	 	:id 		=> "1a2b",
    	 	:first_name	=> "First",
    	 	:last_name 	=> "Last",
    	 	:email 		=> params[:username], 
    	 	:avater		=> "http://ladyenews.files.wordpress.com/2011/03/smiley-emoticon.png"
    	 }
end