require_relative("album")
require_relative("artist")
require_relative("../db/sql_runner")

class Artist
  
  attr_accessor :name
  attr_reader :id

  def initialize(options)

  @name = (options) ["name"]
  @id = (options) ['id'].to_i if options ["id"]

  end

  def save()
    sql = "INSERT INTO artists(name
    )VALUES(
    '#{@name}'
    )RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def Artist.all
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end
    
  def Artist.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end
end
