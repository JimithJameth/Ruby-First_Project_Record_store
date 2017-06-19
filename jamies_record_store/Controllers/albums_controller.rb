require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get'/albums' do
  @albums = Album.all()
  erb( :"albums/index" )
end
