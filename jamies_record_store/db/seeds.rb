require 'pry-byebug'
require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/genre')
Album.delete_all()
Genre.delete_all()
Artist.delete_all()


artist1 = Artist.new({
  "name" => "David Bowie"
  })
artist1.save()

artist2 = Artist.new({
  "name" => "XTC"
  })
artist2.save()

artist3 = Artist.new({
  "name" => "The Kills"
  })
artist3.save()

artist4 = Artist.new({
  "name" => "Peter Gabriel"
  })
artist4.save()

genre1 = Genre.new({
  "type" => "pop"
  })
genre1.save()

genre2 = Genre.new({
  "type" => "indie rock"
  })
genre2.save()

album1 = Album.new({
  "title" => "Heros",
  "genre_id" => genre1.id,
  "artist_id" => artist1.id,
  "quantity" => 15
  })
album1.save()

album2 = Album.new({
  "title" => "Drums and Wires",
  "artist_id" => artist2.id,
  "genre_id" => genre1.id,
  "quantity" => 4
  })
album2.save()

album3 = Album.new({
  "title" => "No wow",
  "artist_id" => artist3.id,
  "genre_id" => genre2.id,
  "quantity" => 7
  })
album3.save()

album4 = Album.new({
  "title" => "So",
  "artist_id" => artist4.id,
  "genre_id" => genre1.id,
  "quantity" => 10
  })
album4.save()

binding.pry
nil