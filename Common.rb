# Common.rb
require "sinatra"
require "sinatra/json"
require_relative "Errors"

## Parameter & Headers Handeling
################################

# Always Check that headers exist
before '/*/*' do
      check_headers(['X-App-Token', 'X-App-Version', 'Accept-Language', 'Authorization'])
end

helpers do
      def check_params(array)
            @missing_param = check_if_contains(params, array)
            if @missing_param
                  halt render_error(:missing_parameter, nil, @missing_param)
            end
      end

      def check_headers(array)

            # Down case & replace hyphen with underscore
            array.each { |item| item.downcase!.tr!("-", "_") }

            @missing_header = check_if_contains(request_headers, array)
            if @missing_header
                  halt render_error(:header_required, nil, @missing_header)
                  # halt render_error(:header_required, request_headers, @missing_header)
            end
      end
end

## Base Class
################################

class Jsonable
   def to_json(options = {})
         hash = {}
         self.instance_variables.each do |var|
            hash[var.to_s.sub(/^@/, '')] = self.instance_variable_get var
         end
         hash.to_json(options)
    end
end

## Helpers
################################

def check_if_contains(dictionary, array)
      array.each { |item| 
            if not dictionary[item] 
                  return item 
            end 
      }
      return nil
end

def request_headers
    env.inject({}){|acc, (k,v)| acc[$1.downcase] = v if k =~ /^http_(.*)/i; acc}
end