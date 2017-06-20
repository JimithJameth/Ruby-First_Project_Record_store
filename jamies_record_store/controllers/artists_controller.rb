require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get'/artists' do
  @artists = Artist.all()
  erb( :"artists/index" )
end

get'/artists/new' do
  erb( :"artists/new")
end

post'/artists' do
  artist = Artist.new(params)
  artist.save()
  redirect to '/'
end

post'/artists/:id/delete' do
  artist = Artist.find(params["id"])
  artist.delete()
  redirect to '/'
end

