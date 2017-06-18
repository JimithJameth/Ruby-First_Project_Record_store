require_relative("artist")
require_relative("album")
require_relative("genre")
require_relative("../db/sql_runner")

class Genre

  attr_accessor :genre_id
  attr_reader :id

  def initialize(options)

  @genre_id = options["genre_id"].to_i
  @id = options["id"].to_i

  end

  def save()
    sql = "INSERT INTO genres (type)
    VALUES(
    '#{@type}'
    )RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end
end
