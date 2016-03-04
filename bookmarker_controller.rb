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

#  EDIT
get '/bookmarker/:id/edit' do
  @bookmarker = Bookmarker.find(params[:id])  
  erb(:edit)
end

# UPDATE PATH
  post '/bookmarker/:id' do
  Bookmarker.update(params)
  redirect to("/bookmarker/#{params[:id]}")  # a get request --> runs show block
end

# CREATE
post '/bookmarker' do 
  @bookmarker = Bookmarker.new( params )
  @bookmarker.save
  erb( :create )
end

#  DESTROY
post '/bookmarker/:id/delete' do
  Bookmarker.destroy(params[:id])
  redirect to('/bookmarker')
end
