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
  if @store.save
    redirect '/add_store'
  else
    @error_message = "store name already added"
  end
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

get '/all_stores' do
  @stores = Store.all
  erb :all_stores
end

## brand paths

get '/add_brand' do
  @brands = Brand.all
  erb :add_brand
end

post '/add_brand' do
  brand_name = params['brand_name']
  price = params['price']
  @brand = Brand.create(name: brand_name, price: price)
  if @brand.save
    redirect 'add_brand'
  else
    @error_message = "brand name already added"
  end
end

get '/all_brands' do
  @brands = Brand.all
  erb :all_brands
end

## brands to stores paths
get '/store/:id/add_brands' do
  @store = Store.find(params['id'].to_i)
  @brands = Brand.all
  erb :add_brands_to_store
end

patch '/store/:id' do
  store_id = params['id'].to_i
  @store = Store.find(store_id)
  current_ids = @store.brands.map(&:id)
  brand_ids = params['brand_ids']
  all_brands = current_ids + brand_ids
  @store.update({:brand_ids => all_brands})
  redirect "/store/#{store_id}"
end
