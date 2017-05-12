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

get '/store/:id' do
  @store = Store.find(params['id'].to_i)
  erb :store
end

patch '/store/:id/updated' do
  store_id = params['id'].to_i
  @store = Store.find(store_id)
  store_name = params['store_name']
  @store.update({:name => store_name})
  redirect "/store/#{store_id}"
end

delete '/store/:id' do
  store = Store.find(params['id'].to_i)
  store.delete
  redirect '/add_store'
end

## brand paths
