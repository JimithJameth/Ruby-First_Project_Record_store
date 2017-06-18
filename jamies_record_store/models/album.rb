require_relative("artist")
require_relative("album")
require_relative("../db/sql_runner")

class Album

  attr_accessor :title
  attr_reader :id

  def initialize(options)
    
  @title = (options) ["title"]
  @id = (options) ["id"].to_i if options ["id"]

  end

  def save()

    sql = "INSERT INTO albums(title
    )VALUES(
    '#{@title}'
    )RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def Album.all
    sql ="SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album|Album.new(album) }
  end

  def Album.delete_all
      sql = "DELETE FROM albums"
      SqlRunner.run(sql) 
  end

    
end