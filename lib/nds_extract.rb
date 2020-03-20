$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
  movie_index = 0
  all_movies = director_data[:movies]
  director_gross = 0
  while movie_index < all_movies.length do
    director_gross += all_movies[movie_index][:worldwide_gross]
    movie_index += 1
  end
  director_gross
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(nds)
  result = {}
  director_index = 0
  while director_index < nds.length do
    director = nds[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

directors_totals([{ :name => "Test Director", :movies => []}]))
directors_totals(directors_database)
