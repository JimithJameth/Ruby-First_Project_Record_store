require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get'/inventory' do
  @albums = Album.all()
  erb(:inventory)
end