require_relative('../db/sql_runner.rb')

class Star

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars(
    first_name,
    last_name)
    VALUES( $1,$2)
    RETURNING id"
    values = [@first_name, @last_name]
    star = SqlRunner.run(sql, values)[0]
    @id = star['id'].to_i
  end

  def update()
    sql = "UPDATE stars SET first_name = $1, last_name = $2 WHERE id = $3"
    values = [@first_name,@last_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM stars;"
    stars = SqlRunner.run(sql)
    result = stars.map{|star| Star.new(star)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def movies()
    sql = "SELECT * FROM movies
    INNER JOIN castings
    ON castings.movie_id = movies.id
    INNER JOIN stars
    ON stars.id = castings.star_id
    where castings.star_id = $1"
    values = [@id]
    movies = SqlRunner.run(sql, values).first
    return movies.map{|movie| Star.new(movies)}
  end







end
