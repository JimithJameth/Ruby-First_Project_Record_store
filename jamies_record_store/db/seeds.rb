require 'pry-byebug'
require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/genre')
Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "David Bowie"
  })
artist1.save()

artist2 = Artist.new({
  "name" => "XTC"
  })
artist2.save()

  
album1 = Album.new({
  "title" => "Heros",
  "artist_id" => artist1.id
  })

album1.save()

album2 = Album.new({
  "title" => "Drums and Wires",
  "artist_id" => artist2.id
  })
album2.save()


binding.pry
nil