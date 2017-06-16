require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/genre')

artist_1 = Artist.new({
  "name" => "David Bowie"
  })