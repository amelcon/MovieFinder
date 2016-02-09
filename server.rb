require 'sinatra'
require './models/siskel.rb'

get '/:name' do
  title = params[:name]
  @movie = Siskel.new(title)
  erb :index
end
