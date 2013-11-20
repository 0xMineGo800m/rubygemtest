# Nova.rb
require "sinatra"
require "sinatra/json"

require_relative "Users"

get '/?' do
    'Nova APIs mocks - UP & RUNNING :)'
end