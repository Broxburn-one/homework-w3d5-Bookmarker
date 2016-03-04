require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/bookmarker')

# CREATE
get '/bookmarker/new' do 
  erb(:new)
end


# SHOW
get '/bookmarker/:id' do 
  @bookmarker = Bookmarker.find(params[:id])  
  erb(:show)
end