require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/bookmarker')


get '/bookmarker' do
  @bookmarkers = Bookmarker.all()
  erb ( :index )
end




get '/bookmarker/new' do 
  erb(:new)
end


# SHOW
get '/bookmarker/:id' do 
  @bookmarker = Bookmarker.find(params[:id])  
  erb(:show)
end

# CREATE
post '/bookmarker' do 
  @bookmarker = Bookmarker.new( params )
  @bookmarker.save
  erb( :create )
end