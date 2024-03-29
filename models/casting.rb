require_relative('../db/sql_runner.rb')
require_relative('./movie.rb')
require_relative('./star.rb')


class Casting

  attr_reader :id
  attr_accessor :movie_id, :star_id, :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
    @fee = options['fee'].to_i

  end


  def save()
    sql = "INSERT INTO castings(
    movie_id,
  star_id,
  fee)
  VALUES( $1,$2, $3)
  RETURNING id"
  values = [@movie_id, @star_id, @fee]
  movie = SqlRunner.run(sql, values).first
  @id = movie['id'].to_i
end


def self.delete_all()
  sql = "DELETE FROM castings"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM castings;"
  castings = SqlRunner.run(sql)
  result = castings.map{|casting| Casting.new(casting)}
  return result
end

def update()
  sql = "UPDATE castings SET movie_id = $1, star_id = $2, fee = $3 WHERE id = $4"
  values = [@movie_id, @star_id, @fee, @id]
  SqlRunner.run(sql, values)
end


end
