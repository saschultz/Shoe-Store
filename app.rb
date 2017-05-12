require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'pry'

get '/' do
  erb :index
end

## store paths

get '/add_store' do
  @stores = Store.all
  erb :add_store
end

post '/add_store' do
  store_name = params["store_name"]
  @store = Store.create(name: store_name)
  redirect '/add_store'
end

## brand paths
