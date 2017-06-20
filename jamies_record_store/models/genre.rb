require_relative("artist")
require_relative("album")
require_relative("genre")
require_relative("../db/sql_runner")

class Genre

  attr_reader :id,:type

  def initialize(options)

  @type = options["type"]
  @id = options["id"].to_i

  end

  def save()
    sql = "INSERT INTO genres (type)
    VALUES(
    '#{@type}'
    )RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def Genre.all
    sql = "SELECT * FROM genres"
    genres = SqlRunner.run(sql)
    return genres.map { |genre|Genre.new(genre) }
  end


  def Genre.delete_all
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

  def Genre.find(id)
    sql = "SELECT * FROM genres WHERE id = #{id}"
    genre = SqlRunner.run(sql).first()
    return Genre.new(genre)
  end

  def delete
    sql ="DELETE FROM genres WHERE id = #{@id}"
    SqlRunner.run(sql)
  end
end
