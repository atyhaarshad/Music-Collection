require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Albums

  attr_accessor :name, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
  end

  def save()
    sql = "INSERT INTO album (name, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i()
  end

  # def self.all()
  #   sql = "SELECT * FROM albums"
  #   results = SqlRunner.run(sql)
  #   return results.map{|album| Album.new(artist)}
  # end
  #
  # def self.find_by_artist(artist_id)
  #   sql = "SELECT * FROM albums WHERE artist_id = $1"
  #   values = [artist_id]
  #   result = SqlRunner.run(sql, values)[0]
  #   return Albums.new(result)
  # end
  #
  # def self.find_by_id(id)
  #   sql = "SELECT * FROM albums WHERE id = $1"
  #   values = [id]
  #   result = SqlRunner.run(sql, values)[0]
  #   return Album.new(result)
  # end
  #
  # def artist()
  #   sql = "SELECT * FROM artists WHERE artist_id = $1"
  #   values = [@artist_id]
  #   result = SqlRunner.run(sql, values)
  #   return Artist.new(result)
  # end
  #
  # def delete()
  #   sql = "DELETE FROM albums WHERE artist_id = $1"
  #   values = [@artist_id]
  #   SqlRunner.run(sql, values)
  # end

  def self.delete_all()
    sql = "DELETE FROM album"
    SqlRunner.run(sql)
  end
  #
  # def edit()
  #   sql = "UPDATE albums SET (name, genre, customer_id) = ($1, $2, $3) WHERE id = $4"
  #   values = [@name, @genre, @customer_id, @id]
  #   SqlRunner.run(sql, values)
  # end




end
