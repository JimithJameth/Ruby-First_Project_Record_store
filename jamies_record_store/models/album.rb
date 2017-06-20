require_relative("artist")
require_relative("album")
require_relative("genre")
require_relative("../db/sql_runner")

class Album

  attr_accessor :title ,:quantity
  attr_reader :id, :price

  def initialize(options)
    
  @title = options ["title"]
  @id = options ["id"].to_i if options ["id"]
  @artist_id = options['artist_id'].to_i
  @genre_id = options['genre_id'].to_i
  @quantity = options['quantity'].to_i
  @price = options['price'].to_i
  end

  def save()

    sql = "INSERT INTO albums(title,artist_id,genre_id,quantity,price
    )VALUES(
    '#{@title}',
     #{@artist_id},
     #{@genre_id},
     #{@quantity},
     #{@price}
    )RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i
  end

  def price_as_pounds
   return "£"+ sprintf("%.2f", @price.to_f / 100) 
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

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id}"
    album = SqlRunner.run(sql)[0]
    return Album.new(album)
  end

  def Album.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql) 
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end
    
  def genre
    sql = "SELECT * FROM genres WHERE id = #{@genre_id}"
    results = SqlRunner.run(sql)
    genre_data = results[0]
    return Genre.new(genre_data)
  end

  def stock_level
    if @quantity >= 15
      return "high"
    end
    if @quantity >= 7
      return "medium"
    end
    return "low"
  end
end
    
