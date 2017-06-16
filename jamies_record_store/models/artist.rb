require_relative("album")
require_relative("artist")
require_relative("..db/sql_runner")

class Artist
  
  attr_accessor :name
  attr_reader :id

  def initialize(options)

  @name = name(options)["name"]
  @id = id (options) ['id'].to_i if options ["id"]

  end
end
