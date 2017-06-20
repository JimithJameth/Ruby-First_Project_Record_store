get '/genres' do
  @genres = Genre.all()
  erb(:"genres/index")
end

post '/genres/:id/delete' do
  genre = Genre.find(params["id"])
  genre.delete()
  redirect to '/'
end

post '/genres' do
  genre = Genre.new(params)
  genre.save()
  redirect to'/genres'
end

get'/genres/new' do
  erb( :"genres/new")
end