get '/genres' do
  @genres = Genre.all()
  erb(:"genres/index")
end

post '/genres/:id/delete' do
  genre = Genre.find(params)["id"]
  genre.delete()
end