require_relative('models/movie')
require_relative('models/casting')
require_relative('models/star')

require('pry-byebug')

Casting.delete_all
Movie.delete_all
Star.delete_all


star1 = Star.new({'first_name' => 'The', 'last_name' => 'Rock'})
star1.save

movie1 = Movie.new({'title' => 'Pain and Gain', 'genre' => 'comedy'})
movie1.save

casting1 =Casting.new("fee" => "1000", 'movie_id' => movie1.id, 'star_id' => star1.id)
casting1.save

binding.pry
nil
