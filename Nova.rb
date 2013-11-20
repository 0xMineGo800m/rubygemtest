# Nova.rb

require "sinatra"
require "sinatra/json"

require_relative "Services/Users"

get '/?' do
    'Nova APIs mocks - UP & RUNNING :)'
end