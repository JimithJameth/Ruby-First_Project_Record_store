require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get'/albums' do
  @albums = Album.all()
  erb( :"albums/index" )
end

get'/albums/new' do
  @artists = Artist.all()
  @genres = Genre.all()
  erb( :"albums/new")
end

post'/albums' do
  album = Album.new(params)
  album.save()
end

post'/albums/:id/delete' do
  album = Album.find(params["id"])
  album.delete()
  redirect to '/'
end