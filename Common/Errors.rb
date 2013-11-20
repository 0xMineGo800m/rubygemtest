# Errors.rb

## Errors handeling
#######################

def render_error(key, message = nil, param = '')
      status HTTP_STATUS_CODES[ERROR_CODES[key][:status]]
      json :error => { 
            :code => ERROR_CODES[key][:code],
            :message => message,
            :description => ERROR_CODES[key][:message] % [param]
      }
end

HTTP_STATUS_CODES = {
      :bad_request =>         400,
      :unauthorized =>        401,
      :forbidden =>           403,
      :not_implemented =>     501,
      :service_unavailable => 503
}

ERROR_CODES = {
      # Authentication
      :header_required       => { :status => :bad_request,         :code => 101, :message => "header %s is required" },
      :not_authenticated     => { :status => :unauthorized,        :code => 102, :message => "not authenticated" },
      :access_token_required => { :status => :bad_request,         :code => 103, :message => "access token is required" },
      :authentication_failed => { :status => :bad_request,         :code => 104, :message => "authentication failed: %s" },
      # Params
      :missing_parameter     => { :status => :bad_request,         :code => 201, :message => "missing parameter: %s" },
      :invalid_value         => { :status => :bad_request,         :code => 202, :message => "invalid %s value" },
      :too_long              => { :status => :bad_request,         :code => 203, :message => "%s is too long" },
      :too_many              => { :status => :bad_request,         :code => 204, :message => "too many %s" },
      :cannot_parse          => { :status => :bad_request,         :code => 205, :message => "cannot parse request" },
      # Logic
      :invalid               => { :status => :bad_request,         :code => 301, :message => "invalid" },
      :not_found             => { :status => :bad_request,         :code => 302, :message => "not found" },
      :invalid_operation     => { :status => :bad_request,         :code => 303, :message => "invalid operation" },
      # Permissions
      :not_allowed           => { :status => :forbidden,           :code => 403, :message => "you don't have permissions" },
      # Service
      :not_implemented       => { :status => :not_implemented,     :code => 501, :message => "not implemented" },
      :under_maintenance     => { :status => :service_unavailable, :code => 503, :message => "under maintenance" }
  }