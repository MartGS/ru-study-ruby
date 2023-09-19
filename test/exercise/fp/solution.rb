module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        new_array = array.map do |film|
          film["rating_kinopoisk"].to_f if is_film_match_search_criteria?(film)
        end
        
        new_array.compact!

        result = new_array.sum / new_array.size
      end
      
      def chars_count(films, threshold)
        letter_i = films.reduce(0) do |x, film|
          x += film["name"].count "и" if is_film_match_raiting_value?(film, threshold)
          x
        end

        letter_i
      end

      private

      def is_film_match_raiting_value?(film, threshold)
        film["rating_kinopoisk"].to_f >= threshold
      end

      def is_film_match_search_criteria?(film)
        return false unless is_multiple_countries?(film)
        return false unless is_rating_kinopoisk?(film)
        true
      end

      def is_multiple_countries?(film)
        film["country"].present? && film["country"].split(',').size > 1
      end

      def is_rating_kinopoisk?(film)
        film["rating_kinopoisk"].present? && film["rating_kinopoisk"].to_f > 0
      end
    end
  end
end