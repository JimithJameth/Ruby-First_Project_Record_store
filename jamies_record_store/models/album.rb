require_relative("artist")
require_relative("album")
require_relative("../db/sql_runner")

class Album

  attr_accessor :title 
  attr_reader :id

  def initialize(options)
    
  @title = options ["title"]
  @id = options ["id"].to_i if options ["id"]
  @artist_id = options ['artist_id'].to_i

  end

  def save()

    sql = "INSERT INTO albums(title,artist_id
    )VALUES(
    '#{@title}',
    '#{@artist_id}'
    )RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def update
    sql = "UPDATE albums SET (title,)
    VALUES('#{@title}')
    WHERE id = #{@id}"
  SqlRunner.run(sql)
    
  end

  def Album.all
    sql ="SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album|Album.new(album) }
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    results = SqlRunner.run(sql)
    artist_data = results[0]
    return Artist.new(artist_data)
  end

  def Album.delete_all
      sql = "DELETE FROM albums"
      SqlRunner.run(sql) 
  end

    
end