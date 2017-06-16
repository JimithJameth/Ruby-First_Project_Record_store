require 'pry-byebug'
require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/genre')

artist1 = Artist.new({
  "name" => "David Bowie"
  })

artist1.save()
album1.save()