require 'pry-byebug'
require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/genre')
Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({
  "name" => "David Bowie"
  })

artist2 = Artist.new({
  "name" => "XTC"
  })

  
album1 = Album.new({
  "title" => "Heros",
  "artist_id" => artist1.id
  })

album2 = Album.new({
  "title" => "Drums and Wires",
  "artist_id" => artist1.id
  })

artist1.save()
album1.save()
artist2.save()
album2.save()
artist1.albums()
# binding.pry
nil